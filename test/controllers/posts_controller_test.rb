require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @user = User.create!(email: "abdullah.th@me.com", password: "123")
  end

  test "should get index" do
    get posts_url
    assert_response :success
    assert_select "a", text: "New post", count: 0
  end

  test "index for logged in user should show new post" do
    post login_index_url, params: { user: { email: "abdullah.th@me.com", password: "123" } }
    get posts_url
    assert_response :success
    assert_select "a", text: "New post"
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    post login_index_url, params: { user: { email: "abdullah.th@me.com", password: "123" } }
    assert_difference("Post.count") do
      post posts_url, params: { post: { body: @post.body, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { body: @post.body, title: @post.title, user_id: @post.user_id } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
