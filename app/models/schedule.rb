class Schedule < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  before_save :titleize_field

  validates :field, presence: true, length: { minimum: 3, maximum: 50 }
  validates :date, :home_team_id, :away_team_id, :start_time, presence: true

  private

    def titleize_field
      self.field = self.field.titleize
    end
end
