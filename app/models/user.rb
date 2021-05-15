# frozen_string_literal: true

# User model, includes Friendly ID, controls User objects
class User < ApplicationRecord
  # FriendlyId specific
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  # Force secure password, downcase email address and capitalize names entered on save and validates User object
  has_secure_password

  has_many :selections
  has_many :schedules, -> { distinct }, through: :selections

  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email, :capitalize_first_name, :capitalize_last_name
  before_create :create_activation_digest

  validates :first_name, :last_name, presence: true, length: { minimum: 3, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true, confirmation: true

  validates :bats, :bowls, :role, presence: true, allow_nil: true

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def activate
    update(activated: true, activated_at: Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

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

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
