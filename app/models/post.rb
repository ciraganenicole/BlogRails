class Post < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id', dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'post_id', dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  def recent_comments()
    comments.last(5)
  end
end
