class CreateTamagatchis < ActiveRecord::Migration
  def change
    create_table :tamagatchis do |t|
      t.string :name
      t.integer :level
      t.string :image
      t.datetime :last_fed_on
      t.integer :rank
      t.integer :tid

      t.timestamps null: false
    end
  end
end
