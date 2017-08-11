class UsersController < ApplicationController
  before_action :require_login, only: [:index]
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      log_in(@user)
      redirect_to root_path, flash: {success: "User create"}
    else
      render 'new'  
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 

end
