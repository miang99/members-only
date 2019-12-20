require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:trang)
        
    end

    test "log in with invalid email and valid password" do
        get login_path
        post login_path, params: {session: {
            email: '',
            password: 'password' }}
        assert_template 'sessions/new'
    end

    test "log in with invalid password" do
        get login_path
        assert_template 'sessions/new'
        post login_path, params: {session: {
                                    email: @user.email,
                                    password: '' }}
        assert_template 'sessions/new'
        assert_not flash.nil?
    
    end

    test "log in with valid information followed by log out" do
        get login_path
        post login_path, params: {session: {
                                    email: @user.email,
                                    password:  'password'}}
        assert_redirected_to @user
        follow_redirect!
        assert_select "a[href=?]", login_path, count: 0
        assert_select "a[href=?]", logout_path
        assert_select "a[href=?]", user_path(@user)
        delete logout_path
        assert_redirect_to root_path
        follow_redirect!
        assert_select "a[href=?]", login_path
        assert_select "a[href=?]", logout_path, count: 0
        assert_select "a[href=?]", user_path(@user), count: 0
    end

  
end
