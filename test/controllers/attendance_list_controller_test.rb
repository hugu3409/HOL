require "test_helper"

class AttendanceListControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get attendance_list_show_url
    assert_response :success
  end
end
