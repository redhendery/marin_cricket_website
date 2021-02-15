# frozen_string_literal: true

require 'test_helper'

class NewslettersSignupTest < ActionDispatch::IntegrationTest

  # Newsletter sign up rejections
  test 'INvalid newsletter signup' do
    get new_newsletter_path
    assert_response :success
    assert_no_difference 'Newsletter.count' do
      post newsletters_path, params: { newsletter: { first_name: '',
                                                     last_name: 'a',
                                                     email: 'user@invalid' } }
    end
    assert_template 'newsletters/new'
    assert_select 'div.message-header'
    assert_select 'div.message-body'
  end

  test 'rejects signup if email exists as User account' do
    get new_newsletter_path
    assert_response :success
    assert_no_difference 'Newsletter.count' do
      post newsletters_path, params: { newsletter: { first_name: 'Steve',
                                                     last_name: 'Stevenson',
                                                     email: 'steve@email.com' } }
    end
    follow_redirect!
    assert_template 'static_pages/home'
    assert_select 'div.message-body'
  end

  # Newsletter sign up success
  test 'allows person to sign up for newsletter' do
    get new_newsletter_path
    assert_response :success
    assert_difference 'Newsletter.count', 1 do
      post newsletters_path, params: { newsletter: { first_name: 'Hoon',
                                                     last_name: 'Hoonson',
                                                     email: 'hoon@email.com' } }
    end
    assert_redirected_to root_url
    assert_not flash.empty?
  end
end
