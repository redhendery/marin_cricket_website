# frozen_string_literal: true

require 'test_helper'

class NewslettersControllerTest < ActionDispatch::IntegrationTest
  test 'gets newsletter singup path' do
    get new_newsletter_path
    assert_response :success
    assert_select 'title', 'Newsletter Sign Up | Marin Cricket Club'
  end
end
