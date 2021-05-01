class AddSlugToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :slug, :string
    add_index :schedules, :slug, unique: true
  end
end
