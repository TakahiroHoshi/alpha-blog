require 'test_helper'

class CreateUsersTest < ActionDispatch::IntegrationTest
  def setup
    @user = nil
  end

  test "get new user form and create user" do
    get new_user_path
    assert_template 'users/new'
  end

  test "ceate new user successfully" do
    assert_difference 'User.count', 1 do
      post users_path, user: {name: "Thomas", email: "thomas@aef.aef", password: "password", id: 1}
    end
    assert_redirected_to user_path(id: 1)
  end

end
