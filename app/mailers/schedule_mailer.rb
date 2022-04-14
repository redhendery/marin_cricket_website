class ScheduleMailer < ApplicationMailer
  def upcoming_games_newsletter(newsletter, upcoming)
    @newsletter = newsletter
    @upcoming = Schedule.where(date: Date.current..(Date.current + 7.days))
    @mnb = @upcoming.where(home_team_id: 39).or(@upcoming.where(away_team_id: 39))
    @mno = @upcoming.where(home_team_id: 1).or(@upcoming.where(away_team_id: 1))
    @mns = @upcoming.where(home_team_id: 3).or(@upcoming.where(away_team_id: 3))
    mail to: newsletter.email, subject: 'Marin Cricket Club Games This Weekend!'
  end

  def upcoming_games_email(user, upcoming)
    @user = user
    @upcoming = Schedule.where(date: Date.current..(Date.current + 7.days))
    @mnb = @upcoming.where(home_team_id: 39).or(@upcoming.where(away_team_id: 39))
    @mno = @upcoming.where(home_team_id: 1).or(@upcoming.where(away_team_id: 1))
    @mns = @upcoming.where(home_team_id: 3).or(@upcoming.where(away_team_id: 3))
    mail to: user.email, subject: 'Marin Cricket Club Games This Weekend!'
  end

  def game_sign_up_email(user, schedule)
    @user = user
    @schedule = schedule
    mail to: user.email, subject: 'Game Sign Up Confirmation'
  end

  def game_withdrawal_email(user, schedule)
    @user = user
    @schedule = schedule
    mail to: user.email, subject: 'Availability Withdrawal Confirmation'
  end
end
