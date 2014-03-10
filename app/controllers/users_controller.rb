class UsersController < ApplicationController

  before_filter :signed_in_user, :only => [:edit,:update,:index, :following, :followers]
  before_filter :correct_user, :only => [:edit,:update]

  def index
  end

  def feed
      @articles = @user.feed
   end

  def following
	@user = User.find(params[:id])
	@users = @user.followed_users
  end

  def following
	@user = User.find(params[:id])
	@users = @user.followers
  end



private
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end