class AddTaggingIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :tagging_id, :integer  
  end
end
