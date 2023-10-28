require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_login_url
    assert_response :success
  end

  test "should log in" do
    User.create!(email: "abdullah.th@me.com", password: "123")
    post login_index_url, params: { user: { email: "abdullah.th@me.com", password: "123" } }
    assert_redirected_to dashboard_index_url
    assert_equal "You are logged in!", flash[:notice]
  end

  test "should redirected to dashboard if already logged in" do
    User.create!(email: "abdullah.th@me.com", password: "123")
    post login_index_url, params: { user: { email: "abdullah.th@me.com", password: "123" } }
    assert_redirected_to dashboard_index_url

    get new_login_url
    assert_redirected_to dashboard_index_url

    get new_registration_url
    assert_redirected_to dashboard_index_url
  end
end
