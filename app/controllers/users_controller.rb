class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    return unless User.exists?(params[:id])

    @user = User.find_by(id: params[:id])
    @posts = @user.posts
    @recent_posts = @user.recent_post
  end
end