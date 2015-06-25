class AddDefault2To < ActiveRecord::Migration
  def change
    change_column_default(:guestbooks, :name, 'Anonymous')
  end
end
