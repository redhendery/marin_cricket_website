desc 'Send weekly email about upcoming games every Monday at 5:30am PST'
task upcoming_games_newsletter: :environment do
  if Date.today.monday?
    newsletters = Newsletter.all
    upcoming = Schedule.where(date: Date.current..(Date.current + 7.days))
    unless upcoming.empty?
      newsletters.each do |newsletter|
        ScheduleMailer.upcoming_games_newsletter(newsletter, upcoming).deliver_now
      end
    end
  end
end
