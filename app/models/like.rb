class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def self.update_counter(post_id)
    count_likes = Like.where(post_id:).count
    Post.find_by(id: post_id).update(likesCounter: count_likes)
  end
end
