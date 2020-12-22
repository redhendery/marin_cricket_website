# frozen_string_literal: true

# Mailer defaults for application
class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@marincricketclub.com'
  layout 'mailer'
end
