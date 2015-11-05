class AddForeignKeyToTamagatchi < ActiveRecord::Migration
  def change
      add_index :tamagatchis, :user_id
  end
end
