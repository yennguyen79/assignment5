class UsersController < ApplicationController
  before_action :require_login, only: [:index]
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "User created."
      redirect_to login_path
    else
      render 'new'  
    end
  end

  def index
    @users = User.all 
  end

  

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
  
end
