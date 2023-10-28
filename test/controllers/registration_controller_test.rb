require "test_helper"

class RegistrationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_registration_url
    assert_response :success
  end

  test "should get create" do
    post registration_index_url, params: { user: { email: "a@a.com", password: "123" } }
    # assert_response :success
    assert_equal "user created", flash[:notice]
  end
end
