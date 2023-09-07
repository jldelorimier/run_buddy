class RunsController < ApplicationController
  def new
    @run = Run.new
  end

  def create
    @run = current_user.runs.new(run_params)
    @run.pace = pace_per_mile_in_seconds(params[:run][:minutes], params[:run][:seconds])
    if @run.save!
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
end
