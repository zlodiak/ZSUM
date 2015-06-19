class AddColumnToGuestbook < ActiveRecord::Migration
  def change
    add_column :guestbooks, :user_id, :integer, default: nil
  end
end
