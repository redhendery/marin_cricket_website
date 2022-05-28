class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :about, :date, :end_time, :location, :start_time, :title, presence: true

  private

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end