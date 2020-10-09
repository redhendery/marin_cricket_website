# frozen_string_literal: true

# Mailer defaults for application
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
