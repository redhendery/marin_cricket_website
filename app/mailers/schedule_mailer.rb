class ScheduleMailer < ApplicationMailer
  def upcoming_games_newsletter(newsletter, upcoming)
    @newsletter = newsletter
    @upcoming = Schedule.where(date: Date.current..(Date.current + 7.days))
    @mno = @upcoming.where(home_team_id: 1).or(@upcoming.where(away_team_id: 1))
    @mnt = @upcoming.where(home_team_id: 2).or(@upcoming.where(away_team_id: 2))
    @mns = @upcoming.where(home_team_id: 3).or(@upcoming.where(away_team_id: 3))
    mail to: newsletter.email, subject: 'Marin Cricket Club Games This Weekend!'
  end

  def upcoming_games_email_users(user, upcoming)
    @user = user
    @upcoming = Schedule.where(date: Date.current..(Date.current + 7.days))
    @mno = @upcoming.where(home_team_id: 1).or(@upcoming.where(away_team_id: 1))
    @mnt = @upcoming.where(home_team_id: 2).or(@upcoming.where(away_team_id: 2))
    @mns = @upcoming.where(home_team_id: 3).or(@upcoming.where(away_team_id: 3))
    mail to: user.email, subject: 'Marin Cricket Club Games This Weekend!'
  end
end
