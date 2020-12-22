# frozen_string_literal: true

require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:steve)
  end

  test 'UNsuccessful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: '', email: 'a.g',
                                              password: 'fridge', password_confirmation: 'flunge' } }
    assert_template 'users/edit'
  end

  test 'successful edit with friendly forwarding' do
    get edit_user_path(@user)
    log_in_as(@user)
    first_name = 'Stephen'
    last_name = 'Stephenson'
    email = 'stephen@email.com'
    patch user_path(@user), params: { user: { first_name: first_name,
                                              last_name: last_name, email: email } }
    assert_not flash.empty?
    @user.reload
    assert_equal first_name, @user.first_name
    assert_equal last_name, @user.last_name
    assert_equal email, @user.email
  end
end
