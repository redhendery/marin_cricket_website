desc 'Send weekly email about upcoming games every Monday at 5:30am PST'
task upcoming_games_email: :environment do
  if Date.today.monday?
    users = User.where(activated: true)
    upcoming = Schedule.where(date: Date.current..(Date.current + 7.days))
    unless upcoming.empty?
      users.each do |user|
        ScheduleMailer.upcoming_games_email(user, upcoming).deliver_now
      end
    end
  end
end
