class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def self.update_counter(post_id)
    count_comments = Comment.where(post_id:).count
    Post.find_by(id: post_id).update(commentsCounter: count_comments)
  end
end
