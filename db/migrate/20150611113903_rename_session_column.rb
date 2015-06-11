class RenameSessionColumn < ActiveRecord::Migration
  def change
    rename_column :users, :session_hash, :remember_token
  end
end
