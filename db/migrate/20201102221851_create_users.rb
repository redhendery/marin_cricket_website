# frozen_string_literal: true

# Migration file for User model
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, unique: true
      t.string :password_digest

      t.timestamps
    end
  end
end
