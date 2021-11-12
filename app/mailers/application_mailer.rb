# frozen_string_literal: true

# Mailer defaults for application
class ApplicationMailer < ActionMailer::Base
  default from: 'Marin Cricket Club <noreply@marincricketclub.com>'
  layout 'mailer'
end
