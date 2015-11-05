class AddScoreToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :score, :integer, default:0
  end
end
