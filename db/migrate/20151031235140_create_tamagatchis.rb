class CreateTamagatchis < ActiveRecord::Migration
  def change
    create_table :tamagatchis do |t|
      t.string :name
      t.integer :level
      t.string :image
      t.date :last_fed_on
      t.integer :rank

      t.timestamps null: false
    end
  end
end
