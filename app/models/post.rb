class Post < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id', dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'post_id', dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  after_save :update_counter

  def update_counter(user_id)
    count_posts = Post.where(user_id:).count
    User.find_by(id: user_id).update(postsCounter: count_posts)
  end

  def recent_comments()
    comments.last(5)
  end
end
