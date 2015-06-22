class AddDefaultToPosts < ActiveRecord::Migration
  def change
    change_column_default(:posts, :views, 0)
  end
end
