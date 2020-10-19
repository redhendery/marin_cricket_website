# frozen_string_literal: true

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = 'Marin Cricket Club'
  end

  test 'should get home' do
    get root_path
    assert_response :success
    assert_select 'title', @base_title.to_s
  end

  test 'should get about' do
    get about_path
    assert_response :success
    assert_select 'title', "About | #{@base_title}"
  end

  test 'should get executives' do
    get executives_path
    assert_response :success
    assert_select 'title', "Executives | #{@base_title}"
  end

  test 'should get history' do
    get history_path
    assert_response :success
    assert_select 'title', "History | #{@base_title}"
  end

  test 'should get membership' do
    get membership_path
    assert_response :success
    assert_select 'title', "Membership | #{@base_title}"
  end

  test 'should get sponsors' do
    get sponsors_path
    assert_response :success
    assert_select 'title', "Sponsors | #{@base_title}"
  end
end
