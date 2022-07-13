class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = @post.comments
  end
end
