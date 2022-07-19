# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview
	def new_event_email
		event = Event.first
		user = User.second
		newsletter = Newsletter.last
		EventMailer.new_event_email(user, event, newsletter)
	end

end
