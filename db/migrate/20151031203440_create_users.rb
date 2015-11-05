class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :admin, default:0
      t.string :reset_pw_url
      t.timestamp :reset_pw_expire

      t.timestamps null: false
    end
  end
end
