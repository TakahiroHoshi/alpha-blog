require 'test_helper'

class CreateUsersTest < ActionDispatch::IntegrationTest
  def setup
    @user = nil
  end

  test "get new user form and create user" do
    get new_user_path
    assert_template 'users/new'
  end

end
