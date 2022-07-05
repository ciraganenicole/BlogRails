class CreateLikeModels < ActiveRecord::Migration[7.0]
  def change
    create_table :like_models do |t|

      t.timestamps
    end
  end
end
