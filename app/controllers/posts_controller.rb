class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts
  end

  def show
    # @user = User.find(params[:user_id])
    @user = current_user
    @post = @user.posts.find(params[:id])
    @comment = @post.comments
  end

  def new
    # @user = User.find(params[:user_id])
    @user = current_user
    @post = @user.posts.new
  end

  def create
    # @user = User.find(params[:user_id])
    @user = current_user
    @post = @user.posts.create(post_params)

    @post.user = @user
    redirect_to user_posts_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
