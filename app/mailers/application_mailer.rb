# frozen_string_literal: true

# Mailer defaults for application
class ApplicationMailer < ActionMailer::Base
  default from: 'marincricketclubwebsite@gmail.com'
  layout 'mailer'
end
