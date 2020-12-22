# frozen_string_literal: true

# Migration file for User model
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, unique: true
      t.text :profile
      t.string :password_digest
      t.string :role, default: 'Bowler'
      t.string :bats, default: 'Right'
      t.string :bowls, default: 'Right'
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
