class AddPictureToGorClothing < ActiveRecord::Migration
  def change
  	add_column :gor_clothings, :picture, :string
  end
end
