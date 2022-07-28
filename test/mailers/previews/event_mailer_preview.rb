# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview
	def new_event_email
		event = Event.first
		user = User.second
		EventMailer.new_event_email(user, event)
	end

	def event_reminder_email
		event = Event.first
		user = User.second
		EventMailer.event_reminder_email(user, event)
	end

	def event_cancelled_email
		event = Event.first
		user = User.second
		EventMailer.event_cancelled_email(user, event)
	end

end
