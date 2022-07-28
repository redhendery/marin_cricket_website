class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :about, :date, :end_time, :location, :start_time, :title, presence: true

  def new_event_email
    users = User.where(activated: true) + Newsletter.all
    users.each do |user|
      EventMailer.new_event_email(user, self).deliver_now
    end
  end

  def event_reminder_email
    users = User.where(activated: true) + Newsletter.all
    users.each do |user|
      EventMailer.event_reminder_email(user, self).deliver_now
    end
  end

  def event_cancelled_email
    users = User.where(activated: true) + Newsletter.all
    users.each do |user|
      EventMailer.event_cancelled_email(user, self).deliver_now
    end
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end