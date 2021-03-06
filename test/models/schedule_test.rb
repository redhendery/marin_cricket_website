require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  def setup
    @schedule = Schedule.new(
      date: Date.today + 2.weeks,
      home_team_id: 3,
      away_team_id: 5,
      opponent: 'over Appealing All stars',
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
end
