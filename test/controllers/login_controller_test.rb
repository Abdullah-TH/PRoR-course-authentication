require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_login_url
    assert_response :success
  end

  test "should get create" do
    User.create!(email: "abdullah.th@me.com", password: "123")
    post login_index_url, params: { user: { email: "abdullah.th@me.com", password: "123" } }
    # assert_response :success
    assert_equal "You are logged in!", flash[:notice]
  end
end
