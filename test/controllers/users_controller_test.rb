require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_url
    assert_response :success
  end

  # change after add model
=begin
  test "should get show" do
    get users_show_url
    assert_response :success
  end
=end
end

