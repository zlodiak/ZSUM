class RenameTableGuestbook < ActiveRecord::Migration
  def change
    rename_table :guestbooks, :recalls
  end
end
