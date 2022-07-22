class PostsController < ApplicationController
  def index
    @user = @user = User.includes(posts: %i[comments likes]).find_by(id: params[:user_id])
    @post = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = @post.comments
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    @post.user = @user

    if @post.user
      redirect_to user_posts_path(@user, @post), notice: 'Post was successfully created!'
    else
      render :new
      flash[:alert] = 'Failed to create a post!'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
