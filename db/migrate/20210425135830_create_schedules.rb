class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.date :date
      t.bigint :away_team_id
      t.bigint :home_team_id
      t.string :opponent
      t.time :start_time, default: '9:45'

      t.timestamps
    end
  end
end
