# frozen_string_literal: true

# Contains User Mailer methods for sending mail to Users
class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: 'Marin Cricket Club Account Activation'
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Password Reset Request for marincricketclub.com'
  end
end
