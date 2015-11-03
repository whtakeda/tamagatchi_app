class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :message_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
