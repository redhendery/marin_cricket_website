class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :about
      t.string :home_field
      t.string :abbreviation

      t.timestamps
    end
  end
end
