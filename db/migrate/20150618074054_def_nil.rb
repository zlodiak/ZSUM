class DefNil < ActiveRecord::Migration
  def change
    change_column_default(:posts, :views, nil)
  end
end
