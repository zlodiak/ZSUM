class AddViewsDiaryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :views_diary, :integer, :default => 0
  end
end
