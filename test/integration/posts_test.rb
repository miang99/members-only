require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:trang)
    
  end
  test "get posts/index" do
    get posts_path
    assert_template 'posts/index'
  end

=begin 
need to log in to test for the app
  test "get post form" do
    
    get new_post_path
    assert_template 'posts/new'
  end
=end

# need to check the authentication
test "redirect to root_path after create a new valid post" do
    post posts_path, params: { post: {
                                    user_id: @user.id,
                                    title: "first post",
                                    body: "this is the first post"}}
    assert_redirected_to root_path
    follow_redirect!
  end
end
