class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'user_id', dependent: :destroy
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id', dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true
  validates :postsCounter, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def recent_post
    posts.last(3)
  end
end
