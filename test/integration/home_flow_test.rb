require 'test_helper'

class HomeFlowTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_response :success
    assert_select "h1", "Web Watch"
  end
end
