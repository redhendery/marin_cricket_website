class Team < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  before_save :titleize_team_name, :upcase_abbreviation, :titleize_home_field

  validates :home_field, presence: true, length: { minimum: 3, maximum: 50 }
  validates :abbreviation, presence: true, uniqueness: true, length: { is: 3 }
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }

  private

  def titleize_team_name
    self.name = self.name.titleize
  end

  def upcase_abbreviation
    self.abbreviation = self.abbreviation.upcase
  end

  def titleize_home_field
    self.home_field = self.home_field.titleize
  end
end
