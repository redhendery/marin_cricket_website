# Preview all emails at http://localhost:3000/rails/mailers/schedule_mailer
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
end
