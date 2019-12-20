class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      #create session
      log_in(@user)
      flash[:success] = "Welcome back!"
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
