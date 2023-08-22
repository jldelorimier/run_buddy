class CreateRuns < ActiveRecord::Migration[7.0]
  def change
    create_table :runs do |t|
      t.time :start_time_beginning
      t.time :start_time_end
      t.float :distance
      t.integer :pace
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
