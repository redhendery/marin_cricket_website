class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :about, :date, :end_time, :location, :start_time, :title, presence: true

  def new_event
    users = User.where(activated: true).pluck(:email) + Newsletter.pluck(:email)
    users.each do |user|
      EventMailer.send_new_event_email(user, self).deliver_now
    end
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end