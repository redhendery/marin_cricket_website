# frozen_string_literal: true

# Migration for Friendly ID for pretty slugs
class AddSlugToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
  end
end
