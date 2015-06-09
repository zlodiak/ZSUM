class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_hash
      t.string :session_hash
      t.integer :gender
      t.string :phone
      t.string :skype
      t.text :info

      t.timestamps null: false
    end
  end
end
