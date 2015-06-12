class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :diary_name, :string
  end
end
