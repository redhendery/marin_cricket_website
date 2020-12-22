# frozen_string_literal: true

require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  def setup
    @admin_user = users(:steve)
    @other_user = users(:dave)
    remember(@admin_user)
  end

  test 'current_user returns right user when session is nil' do
    assert_equal @admin_user, current_user
    assert logged_in?
  end

  test 'current_user returns nil when remember digest is wrong' do
    @admin_user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end

  test 'checks if logged_in user has admin priviledge' do
    assert_equal @admin_user, current_user
    assert admin_logged_in?
  end

  test 'checks if logged_in user is NOT admin user' do
    log_in_as(@other_user)
    assert_equal @other_user, current_user
    assert_not admin_logged_in?
  end
end
