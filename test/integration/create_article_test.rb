require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest
  def setup
    @user = nil
  end

  test "fail to create when not logged in" do
    assert_no_difference 'Article.count', 1 do
      post articles_path, article: {title: "aaaaa", description: "fawoeifjoiwaefjaw", category_ids: ""}
    end
    assert_redirected_to root_path
  end

  test "cannot reach 'article/new' template when not logged in" do
    get new_article_path
    assert_response :redirect
    assert_redirected_to root_path    
  end

  test "successfully created when logged in" do
    @user = User.create(name: "Thomas", email: "tom@aef.aef", password: "password", admin: true)
    sign_in_as(@user, "password")    
    assert_difference 'Article.count', 1 do
      post articles_path, article: {title: "aaaaa", description: "fawoeifjoiwaefjaw", category_ids: ""}
    end
    assert_redirected_to article_path(id: 1)
  end

end
