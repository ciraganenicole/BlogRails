class PostsController < ApplicationController
  load_and_authorize_resource

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

  def destroy
    @user = User.find(params[:user_id]) # current_user
    post = Post.find(params[:id])

    if post.destroy
      flash[:success] = 'Post deleted successfully'
      redirect_to user_posts_path(@user)
    else
      flash.now[:error] = 'Error: Post could not be deleted'
      redirect_to user_post_path(@user, post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
