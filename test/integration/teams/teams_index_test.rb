require 'test_helper'

class TeamsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:steve)
    @non_admin = users(:dave)
    @team = teams(:socials)
  end

  test 'index as non-admin' do
    log_in_as(@non_admin)
    get teams_url
    assert_select 'a', text: 'edit', count: 0
    assert_select 'a', text: 'delete', count: 0
  end

  test 'index as admin with admin links' do
    log_in_as(@admin)
    get teams_url
    assert_template 'teams/index'
    assert_difference 'Team.count', -1 do
      delete team_path(@team)
    end
    follow_redirect!
    assert_template 'teams/index'
    assert_not flash.empty?
  end

end
