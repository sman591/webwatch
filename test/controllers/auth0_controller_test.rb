require 'test_helper'

class Auth0ControllerTest < ActionDispatch::IntegrationTest
  test "should get callback" do
    get auth_auth0_callback_url
    follow_redirect!
    assert_response :success
    assert_not_nil flash[:notice]
  end

  # test "should get failure" do
  #   get auth_failure_url
  #   assert_response :success
  # end

  test "should log out" do
    login
    assert_not_nil session[:userinfo]
    get auth_auth0_logout_url
    assert_nil session[:userinfo]
    assert_not_nil flash[:notice]
  end
end
