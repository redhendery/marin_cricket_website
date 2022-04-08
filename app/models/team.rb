class Team < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  before_save :abbreviation_upcase, :titleize_home_field

  validates :home_field, presence: true, length: { minimum: 3, maximum: 50 }
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :abbreviation, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }

  private

  def abbreviation_upcase
    self.abbreviation = self.abbreviation.upcase
  end

  def titleize_home_field
    self.home_field = self.home_field.titleize
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
