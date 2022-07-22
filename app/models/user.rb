class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, class_name: 'Post', foreign_key: 'user_id', dependent: :destroy
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id', dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true
  validates :postsCounter, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def recent_post
    posts.last(3)
  end
end
