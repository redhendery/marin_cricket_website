require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  def setup
    @schedule = Schedule.new(
      date: Date.today + 2.weeks,
      home_team_id: 3,
      away_team_id: 5,
      start_time: '10:45',
      opponent: 'over Appealing All stars',
      field: 'piper park'
    )
  end

  test 'date must be present' do
    @schedule.date = nil
    assert_not @schedule.valid?
  end

  test 'home team id must be present' do
    @schedule.home_team_id = nil
    assert_not @schedule.valid?
  end

  test 'away team id must be present' do
    @schedule.away_team_id = nil
    assert_not @schedule.valid?
  end

  test 'start_time must be present' do
    @schedule.start_time = nil
    assert_not @schedule.valid?
  end

  test 'opponent must be present' do
    @schedule.opponent = nil
    assert_not @schedule.valid?
  end

  test 'opponent length not to short' do
    @schedule.opponent = 'a' * 2
    assert_not @schedule.valid?
  end

  test 'opponent length not to long' do
    @schedule.opponent = 'a' * 51
    assert_not @schedule.valid?
  end

  test 'field must be present' do
    @schedule.field = nil
    assert_not @schedule.valid?
  end

  test 'field length not to short' do
    @schedule.field = 'a' * 2
    assert_not @schedule.valid?
  end

  test 'field length not to long' do
    @schedule.field = 'a' * 51
    assert_not @schedule.valid?
  end
end
