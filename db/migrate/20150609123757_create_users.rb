class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :session_hash
      t.string :phone
      t.string :skype
      t.string :info
      t.integer :gender

      t.timestamps null: false
    end
  end
end
