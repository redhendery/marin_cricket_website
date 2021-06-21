# Preview all emails at http://localhost:5000/rails/mailers/schedule_mailer
class ScheduleMailerPreview < ActionMailer::Preview
  def upcoming_games_newsletter
    newsletter = Newsletter.first
    schedule = Schedule.all[1..3]
    ScheduleMailer.upcoming_games_newsletter(newsletter, schedule)
  end

  def upcoming_games_email
    user = User.second
    schedule = Schedule.all[1..3]
    ScheduleMailer.upcoming_games_email(user, schedule)
  end

  def game_sign_up_email
    user = User.first
    schedule = Schedule.second
    ScheduleMailer.game_sign_up_email(user, schedule)
  end

  def game_withdrawal_email
    user = User.first
    schedule = Schedule.second
    ScheduleMailer.game_withdrawal_email(user, schedule)
  end
end
