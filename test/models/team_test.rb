require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  def setup
    @team = Team.new(name: 'marin socials',
                      abbreviation: 'mns',
                      home_field: 'piper park')
  end

  test 'Team Name must be present' do
    @team.name = '      '
    assert_not @team.valid?
  end

  test 'Team Name cannot be to short' do
    @team.name = 'a'
    assert_not @team.valid?
  end

  test 'Team Name cannot be to long' do
    @team.name = 'a' * 51
    assert_not @team.valid?
  end

  test 'Team abbreviation must be present' do
    @team.abbreviation = '      '
    assert_not @team.valid?
  end

  test 'Team Abbreviation cannot be to long' do
    @team.abbreviation = 'a' * 5
    assert_not @team.valid?
  end

  test 'Team Home Field must be present' do
    @team.home_field = '      '
    assert_not @team.valid?
  end

  test 'Team Home Field cannot be to short' do
    @team.home_field = 'a'
    assert_not @team.valid?
  end

  test 'Team Home Field cannot be to long' do
    @team.home_field = 'a' * 51
    assert_not @team.valid?
  end

  test 'Team Home Field Address must be present' do
    @team.home_field = '     '
    assert_not @team.valid?
  end

end
