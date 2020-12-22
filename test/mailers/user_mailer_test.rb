# frozen_string_literal: true

require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'account_activation' do
    user = users(:steve)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal 'Marin Cricket Club Account Activation', mail.subject
    assert_equal [user.email], mail.to
    assert_equal ['noreply@marincricketclub.com'], mail.from
    assert_match user.first_name, mail.body.encoded
    assert_match user.last_name, mail.body.encoded
    assert_match user.activation_token, mail.body.encoded
    assert_match CGI.escape(user.email), mail.body.encoded
  end

  test 'password_reset' do
    user = users(:steve)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal 'Password Reset Request', mail.subject
    assert_equal [user.email], mail.to
    assert_equal ['noreply@marincricketclub.com'], mail.from
    assert_match user.reset_token, mail.body.encoded
    assert_match CGI.escape(user.email), mail.body.encoded
  end
end
