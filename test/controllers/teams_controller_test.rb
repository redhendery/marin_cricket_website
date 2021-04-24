require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:steve)
    @non_admin = users(:dave)
    @team = teams(:socials)
  end

  test 'should get index' do
    get teams_path
    assert_response :success
    assert_select 'title', 'Teams | Marin Cricket Club'
  end

  test 'should get edit if logged in as Admin User' do
    log_in_as(@admin)
    get edit_team_path(@team)
    assert_response :success
  end

  test 'should get new if logged in as Admin User' do
    log_in_as(@admin)
    get new_team_path
    assert_response :success
  end

  test 'should redirect NON Admin User on edit action' do
    log_in_as(@non_admin)
    get edit_team_path(@team)
    follow_redirect!
    assert_template 'teams/index'
  end

  test 'should redirect NON Admin User on new action' do
    log_in_as(@non_admin)
    get new_team_path
    follow_redirect!
    assert_template 'teams/index'
  end

  test 'should redirect NON Admin User on destroy' do
    log_in_as(@non_admin)
    delete team_path(@team)
    follow_redirect!
    assert_template 'teams/index'
  end

  test 'should redirect destroy if not logged in' do
    delete team_path(@team)
    follow_redirect!
    assert_template 'teams/index'
  end

  test 'should allow admin to destroy record' do
    log_in_as(@admin)
    get teams_path
    assert_template 'teams/index'
    assert_difference 'Team.count', -1 do
      delete team_path(@team)
      @team.destroy
    end
  end

end
