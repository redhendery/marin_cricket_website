class Schedule < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  has_many :selections, dependent: :destroy
  has_many :users, -> { distinct }, through: :selections

  validates :date, :home_team_id, :away_team_id, presence: true

  def send_game_sign_up_email(user)
    ScheduleMailer.game_sign_up_email(user, self).deliver_now
  end

  def send_game_withdrawal_email(user)
    ScheduleMailer.game_withdrawal_email(user, self).deliver_now
  end
end
