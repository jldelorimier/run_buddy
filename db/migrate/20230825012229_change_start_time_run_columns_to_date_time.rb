class ChangeStartTimeRunColumnsToDateTime < ActiveRecord::Migration[7.0]
  def up
    add_column :runs, :start_time_beginning_datetime, :datetime
    add_column :runs, :start_time_end_datetime, :datetime

    execute <<-SQL
      UPDATE runs
      SET start_time_beginning_datetime = (timestamp '2023-08-24' + start_time_beginning),
          start_time_end_datetime = (timestamp '2023-08-24' + start_time_end)
    SQL

    remove_column :runs, :start_time_beginning
    remove_column :runs, :start_time_end
    
    rename_column :runs, :start_time_beginning_datetime, :start_time_beginning
    rename_column :runs, :start_time_end_datetime, :start_time_end
  end
end
