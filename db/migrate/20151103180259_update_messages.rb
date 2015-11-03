class UpdateMessages < ActiveRecord::Migration
  def change
    add_column :messages, :is_sticky, :boolean, :default=>false
  end
end
