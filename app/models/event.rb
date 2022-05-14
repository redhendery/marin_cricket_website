class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  private

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
