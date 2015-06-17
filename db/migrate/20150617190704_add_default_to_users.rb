class AddDefaultToUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :gender_id, 1)
  end
end
