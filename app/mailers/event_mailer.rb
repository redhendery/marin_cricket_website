class EventMailer < ApplicationMailer

	def new_event_email(user, event, newsletter)
		@user = user
		@event = event
		@newsletter = newsletter
		mail to: user.email, to: newsletter.email, subject: 'Upcoming MCC Event!'
	end

	def event_reminder 
	end

	def event_cancelled_email
		@user = user
		@event = event
		@newsletter = newsletter
		mail to: user.email, to: newsletter.email, subject: '*** CANCELLED Upcoming MCC Event! CANCELLED ***'
	end

	def event_signup_email
	end

	def event_withdrawal_email
	end
end
