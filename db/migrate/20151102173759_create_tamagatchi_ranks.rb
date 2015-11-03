class CreateTamagatchiRanks < ActiveRecord::Migration
  def change
    create_table :tamagatchi_ranks do |t|
      t.integer :rank
      t.string :image
      t.integer :level

      t.timestamps null: false
    end
  end
end
