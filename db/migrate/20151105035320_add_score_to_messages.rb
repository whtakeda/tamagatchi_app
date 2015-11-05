class AddScoreToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :score, :integer
  end
end
