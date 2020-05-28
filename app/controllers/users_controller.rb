class UsersController < ApplicationController
  layout 'welcome'

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to games_path
    else
      render :new
    end
  end

  skip_before_action :authorized, only: [:new, :create]

  private
  def user_params
    params
      .require(:user)
      .permit(:username, :password, :email, :birth_date)
  end
end
