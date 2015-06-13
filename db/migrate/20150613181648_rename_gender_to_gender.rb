class RenameGenderToGender < ActiveRecord::Migration
  def change
    rename_column(:genders, :gender, :gender_name)
  end
end
