require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "get posts/index" do
    get posts_path
    assert_template 'posts/index'
  end

  test "get post form" do
    get post_path
    assert_template 'posts/new'
  end

  test "redirect to root_path after create a new post" do
    
  end
end
