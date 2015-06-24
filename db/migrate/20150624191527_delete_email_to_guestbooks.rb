class DeleteEmailToGuestbooks < ActiveRecord::Migration
  def change
    remove_column :guestbooks, :email
  end
end
