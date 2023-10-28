require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index if logged in" do
    User.create!(email: "abdullah.th@me.com", password: "123")
    post login_index_url, params: { user: { email: "abdullah.th@me.com", password: "123" } }
    get dashboard_index_url
    assert_response :success
  end

  test "should redirected to login if n" do
    get dashboard_index_url
    assert_redirected_to new_login_url
  end
end
