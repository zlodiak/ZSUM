class AddDefaultTo < ActiveRecord::Migration
  def change
    change_column_default(:guestbooks, :name, 'Anonimous')
  end
end
