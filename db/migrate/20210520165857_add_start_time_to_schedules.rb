class AddStartTimeToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :start_time, :time, default: '10:30'
  end
end
