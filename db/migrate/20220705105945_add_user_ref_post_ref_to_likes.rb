class AddUserRefPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :likes, :users, column: :authorId
    add_foreign_key :likes, :posts, column: :postId
    add_index :likes, :authorId
    add_index :likes, :postId
  end
end
