require "test_helper"

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:steve)
    @non_admin = users(:dave)
    @schedule =  schedules(:socials)
  end

  test 'should get index' do
    get schedules_path
    assert_response :success
    assert_select 'title', 'Schedules | Marin Cricket Club'
  end

  test 'should redirect edit when NOT logged' do
    get edit_schedule_path(@schedule)
    assert_redirected_to schedules_path
  end

  test 'should redirect edit when logged in as NON Admin' do
    log_in_as(@non_admin)
    get edit_schedule_path(@schedule)
    assert_redirected_to schedules_path
  end

  test 'should get edit when logged in as Admin' do
    log_in_as(@admin)
    get edit_schedule_path(@schedule)
    assert_response :success
    assert_select 'title', 'Edit Game | Marin Cricket Club'
  end

  test 'should redirect new when NOT logged' do
    get new_schedule_path
    assert_redirected_to schedules_path
  end

  test 'should redirect new when logged in as NON Admin' do
    log_in_as(@non_admin)
    get new_schedule_path
    assert_redirected_to schedules_path
  end

  test 'should get new when logged in as admin' do
    log_in_as(@admin)
    get new_schedule_path
    assert_response :success
    assert_select 'title', 'Create Game | Marin Cricket Club'
  end
end
