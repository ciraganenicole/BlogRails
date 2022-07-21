class UpdateUsers < ActiveRecord::Migration[7.0]
  add_column :users, :email, :string
  add_column :users, :password, :string
  
end
