class AddIndexToGorClothingPicture < ActiveRecord::Migration
  def change
  	add_index :gor_clothings, :picture, unique: true
  end
end
