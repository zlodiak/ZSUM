class AddDefaultToGuestbook < ActiveRecord::Migration
  def change
    change_column_default(:guestbooks, :user_id, nil)
  end
end
