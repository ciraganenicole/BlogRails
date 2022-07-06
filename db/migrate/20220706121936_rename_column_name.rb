class RenameColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :authorId, :user_id
    rename_column :comments, :authorId, :user_id
    rename_column :comments, :postId, :post_id
    rename_column :likes, :authorId, :user_id
    rename_column :likes, :postId, :post_id

# add back foreign keys
    add_foreign_key :comments, :users, column: :user_id
    add_foreign_key :comments, :posts, column: :post_id
   
    add_foreign_key :likes, :users, column: :user_id
    add_foreign_key :likes, :posts, column: :post_id
   
    add_foreign_key :posts, :users, column: :user_id
  end
end
