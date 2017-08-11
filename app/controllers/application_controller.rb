class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  
  def current_user
    return @current_user if @current_user

    @current_user = User.find_by(id: session[:user_id])
  end

   def log_in(user)
    #  @current_user ||= User.find_by(id: session[:user_id])
    session[:user_id] = user.id
  end
    # def require_login
    #   unless current_user
    #     redirect_to root_path
    #     flas[:error] = "Access Demied. Please login to view"
  def log_out(user)
    session[:user_id] = nil
  end  
end 

