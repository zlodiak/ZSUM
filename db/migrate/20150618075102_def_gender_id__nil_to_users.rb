class DefGenderIdNilToUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :gender_id, nil)
  end
end
