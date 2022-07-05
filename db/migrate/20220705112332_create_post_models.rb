class CreatePostModels < ActiveRecord::Migration[7.0]
  def change
    create_table :post_models do |t|

      t.timestamps
    end
  end
end
