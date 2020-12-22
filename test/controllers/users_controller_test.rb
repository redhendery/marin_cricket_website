# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:steve)
    @other_user = users(:dave)
    @base_title = 'Marin Cricket Club'
  end

  test 'gets User create path' do
    get signup_path
    assert_response :success
    assert_select 'title', "Sign Up | #{@base_title}"
  end

  test 'gets show User path' do
    get user_path(@user)
    assert_response :success
    assert_select 'title', "#{@user.first_name} #{@user.last_name} | #{@base_title}"
  end

  test 'should redirect edit when logged in as different user' do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect update when logged in as different user' do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { first_name: @user.first_name,
                                              last_name: @user.last_name, email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should not allow the admin attribute to be edited via the web' do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
      user: { password: @other_user.password,
              password_confirmation: @other_user.password_confirmation,
              admin: @other_user.admin }
    }
    assert_not @other_user.reload.admin?
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

  test 'should redirect destroy when logged in as a non-admin' do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end
end
