class UpdateComments < ActiveRecord::Migration
  def change
    remove_column :comments, :comment
    add_column :comments, :body, :string
  end
end
