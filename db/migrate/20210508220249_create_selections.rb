class CreateSelections < ActiveRecord::Migration[6.1]
  def change
    create_table :selections do |t|
      t.belongs_to :user, index: true
      t.belongs_to :schedule, index: true

      t.timestamps
    end
    add_index :selections, [:user_id, :schedule_id], unique: true
  end
end
