class Post < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id', dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'post_id', dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :likesCounter, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def update_posts_counter
    user.increment!(:postsCounter)
  end

  def recent_comments()
    comments.last(5)
  end
end
