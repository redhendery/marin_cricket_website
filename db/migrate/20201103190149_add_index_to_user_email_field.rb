# frozen_string_literal: true

# Add index for uniqueness for User email field
class AddIndexToUserEmailField < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email, unique: true
  end
end
