class UpdateTamagatchis < ActiveRecord::Migration
  def change
    remove_column :tamagatchis, :image
  end
end
