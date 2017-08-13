class SessionsController < ApplicationController
  #display login form
  def new 
  end

  def create 
    @user = User.find_by(email: params[:email])
    if @user 
      if @user.authenticate(params[:password])
      log_in(@user)
      redirect_to users_path, flash: {notice: "Loggin"}
    else
      redirect_to login_path, flash: {notice: "Inval"}
      end
    else
      redirect_to login_path, flash: {notice: "Inval"}
    end
    end

  def destroy
    log_out(current_user)
    redirect_to root_path, flash: {success: "Logged out."}
  end
  
  
end