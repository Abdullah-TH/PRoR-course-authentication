require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "email must be present" do
    user = User.new(email: "", password: "123")
    assert user.invalid?
  end

  test "password must be present" do
    user = User.new(email: "a@a.com", password: "")
    assert user.invalid?
  end

  test "user with email and password is valid" do
    user = User.new(email: "a@a.com", password: "123")
    assert user.valid?
  end

end
