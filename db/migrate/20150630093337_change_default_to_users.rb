class ChangeDefaultToUsers < ActiveRecord::Migration
  def change
    change_column :users, :admin, :boolean, :default => nil
  end
end
