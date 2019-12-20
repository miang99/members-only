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
        assert_redirected_to root_path
        follow_redirect!
        assert_select "a[href=?]", login_path
        assert_select "a[href=?]", logout_path, count: 0
    end

    test "log in with remember me" do
        log_in_as(@user)
        assert_equal @user, assigns(:user)
        asssert_not_empty cookies[:remember_token]
        
    end

    test "log in without remember me" do
        # set up cookies
        log_in_as(@user)
        # log in again to check that there no cookies remember = 0
        log_in_as(@user, remember_me: '0')
        assert_empty cookies[:remember_token]
    end

    private

    def log_in_as(user, password: 'password', remember_me: '1')
        post login_path, params: {session: {email: user.email,
                                            password: password,
                                            remember_me: remember_me}}
      end



  
end
