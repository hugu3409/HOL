require "test_helper"

class SelectControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get select_show_url
    assert_response :success
  end
end
