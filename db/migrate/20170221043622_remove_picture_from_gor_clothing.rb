class RemovePictureFromGorClothing < ActiveRecord::Migration
  def change
  	remove_column :gor_clothings, :picture
  end
end
