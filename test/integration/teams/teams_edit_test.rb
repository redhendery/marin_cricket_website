require 'test_helper'

class TeamsEditTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:steve)
    @non_admin = users(:dave)
    @team = teams(:socials)
  end

  test 'redirect edit when not logged in' do
    get edit_team_path(@team)
    assert_redirected_to teams_path
  end

  test 'UNsuccessful edit when admin logged in' do
    log_in_as(@admin)
    get edit_team_path(@team)
    assert_template 'teams/edit'
    patch team_path(@team), params: { team: { name: '',
                            abbreviation: '', home_field: '' } }
    assert_template 'teams/edit'
  end

  test 'Successful edit when admin logged in' do
    log_in_as(@admin)
    get edit_team_path(@team)
    assert_template 'teams/edit'
    name = 'New Team Name'
    abbreviation = 'NTN'
    home_field = 'Space'
    patch team_path(@team), params: { team: { name: name, abbreviation: abbreviation, home_field: home_field } }
    assert_not flash.empty?
    @team.reload
    assert_equal name, @team.name
    assert_equal abbreviation, @team.abbreviation
    assert_equal home_field, @team.home_field
  end
end
