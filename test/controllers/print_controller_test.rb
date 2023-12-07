require "test_helper"

class PrintControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get print_show_url
    assert_response :success
  end
end
