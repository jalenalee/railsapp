class AddMultipleIDsToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :user_id, :integer 
    add_column :posts, :category_id, :integer 
    add_column :posts, :tagging_id, :integer 
  end
end
