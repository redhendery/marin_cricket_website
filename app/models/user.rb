# frozen_string_literal: true

# User model, includes Friendly ID, controls User objects
class User < ApplicationRecord
  # FriendlyId specific
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  # Force secure password, downcase email address and capitalize names entered on save and validates User object
  has_secure_password
  before_save :downcase_email, :capitalize_first_name, :capitalize_last_name
  validates :first_name, :last_name, presence: true, length: { minimum: 3, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  private

  def full_name
    "#{first_name} #{last_name}"
  end

  def downcase_email
    self.email = email.downcase
  end

  def capitalize_first_name
    first_name.capitalize!
  end

  def capitalize_last_name
    last_name.capitalize!
  end
end
