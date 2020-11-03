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
end
