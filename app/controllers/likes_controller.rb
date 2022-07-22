class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id]) # current_user
    liked = Like.where(user:, post:)

    if liked.present?
      flash[:notice] = 'Post already liked'
    else
      like = Like.create(user:, post:)
      if like.save
        redirect_to user_post_path(post.user, post), notice: 'Post successfully liked'
      else
        flash[:alert] = 'Could not like the post, please try again later.'
      end
    end
  end
end
