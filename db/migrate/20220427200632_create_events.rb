class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :about
      t.string :title
      t.string :location

      t.timestamps
    end
  end
end
