class UsersController < ApplicationController
  def follow
    @user = User.find params[:user] rescue nil
    flash.now[:notice] = "Now following!"
    current_user.follow @user
    redirect_to tweets_path
  end
  
  def following
    @following = current_user.following_users
  end
  
  def unfollow
    @user = User.find params[:user] rescue nil
    flash.now[:notice] = "Unfollowed successfully!"
    current_user.stop_following @user
    redirect_to unfollow_url
  end

  def followers
    @followers = current_user.followers
  end
  
end
