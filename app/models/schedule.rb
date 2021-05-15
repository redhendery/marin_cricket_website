class Schedule < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  has_many :selections, dependent: :destroy
  has_many :users, -> { distinct }, through: :selections

  validates :date, :home_team_id, :away_team_id, presence: true
end
