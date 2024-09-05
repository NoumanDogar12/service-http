require "test_helper"

class NumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get process_numbers" do
    get numbers_process_numbers_url
    assert_response :success
  end
end
