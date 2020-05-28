class SessionsController < ApplicationController
  layout 'welcome'

  def welcome
  end

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to games_path
    else
      redirect_to login_path, notice: 'Username or password invalid'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/welcome'
  end

  skip_before_action :authorized, only: [:new, :create, :welcome]
end
