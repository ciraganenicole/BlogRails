class AddUserRefPostRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :users, column: :authorId
    add_foreign_key :comments, :posts, column: :postId
    add_index :comments, :authorId
    add_index :comments, :postId
  end
end
