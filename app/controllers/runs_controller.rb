class RunsController < ApplicationController
  def new
    @run = Run.new
  end

  def create
    @run = current_user.runs.new(run_params)
    @run.pace = pace_per_mile_in_seconds(params[:run][:minutes], params[:run][:seconds])
    if @run.save!
      find_and_create_matches(@run)
      redirect_to root_path, notice: "Run buddy request submitted!"
    else
      flash.now[:alert] = @run.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def pace_per_mile_in_seconds(minutes, seconds)
    (minutes.to_i * 60) + seconds.to_i
  end

  def run_params
    params.require(:run).permit(:start_time_beginning, :start_time_end, :distance)
  end

  def find_and_create_matches(new_run)
    # distance_range = (0.8 * distance)..(1.2 * distance) # this creates an array of various distances. I don't want that.
    # pace_range = (pace - 30)..(pace + 30)
    min_distance = 0.8 * distance
    max_distance = 1.2 * distance
    min_pace = pace - 30
    max_pace = pace + 30
    similar_runs = Run.where(
      "distance >= ? AND distance <= ? AND pace >= ? AND pace <= ?", # Could also be written as `"distance BETWEEN ? AND ? AND pace BETWEEN ? AND ?",` ... remember, BETWEEN is inclusive of upper and lower bounds.
      min_distance, max_distance,
      min_pace, max_pace
    ).where.not(id: id)

    similar_runs.each do |run|
      unless Match.exists?(run1: run, run2: new_run)
        Match.create(run1: self, run2: run)
      end
    end
  end
end
