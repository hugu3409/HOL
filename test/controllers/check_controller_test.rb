require "test_helper"

class CheckControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get check_show_url
    assert_response :success
  end
end
