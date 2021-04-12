require 'test_helper'

class RoutineTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get routine_tasks_new_url
    assert_response :success
  end

  test "should get edit" do
    get routine_tasks_edit_url
    assert_response :success
  end

end
