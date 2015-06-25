class DelViewsUsersFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :views_diary
  end
end
