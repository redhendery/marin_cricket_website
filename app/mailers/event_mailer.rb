class EventMailer < ApplicationMailer

	def new_event_email(user, event)
		@user = user
		@event = event
		mail to: user.email, subject: 'Upcoming MCC Event!'
	end

	def event_reminder_email(user, event)
		@user = user
		@event = event
		mail to: user.email, subject: 'Reminder: Upcoming MCC Event!'
	end

	def event_cancelled_email(user, event)
		@user = user
		@event = event
		mail to: user.email, subject: '*** CANCELLED Upcoming MCC Event! CANCELLED ***'
	end

	def event_signup_email
	end

	def event_withdrawal_email
	end
end
