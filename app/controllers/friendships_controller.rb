class FriendshipsController < ApplicationController
  def new
  end

  def create
    current_user.friendships.create!(friendship_params)
    redirect_to users_path
  end
  def destroy
    user = User.find params[:user_id]
    current_user.friends.delete(user)
    redirect_to users_path

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
end
