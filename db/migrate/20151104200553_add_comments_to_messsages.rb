class AddCommentsToMesssages < ActiveRecord::Migration
  def change
    remove_column :comments, :message_id
    add_reference :comments, :message, index: true, foreign_key: true
  end
end
