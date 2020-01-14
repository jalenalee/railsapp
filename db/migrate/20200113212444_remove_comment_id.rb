class RemoveCommentId < ActiveRecord::Migration[6.0]
  def change
    drop_table :posts do |t|
      t.integer "commentID"
      t.integer "tag_id"
    end 
  end
end
