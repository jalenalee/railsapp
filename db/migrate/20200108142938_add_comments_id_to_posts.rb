class AddCommentsIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :commentID, :integer 
  end
end
