require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
=begin
  def setup
    @user = users(:trang)
    @post = Post.new(title: "first post", body: "today is Saturday")
    
  end

  test "title should not too long" do
    @post = 'a' * 255 + 'a'
    assert_not @post.valid?
  end
=end
end
