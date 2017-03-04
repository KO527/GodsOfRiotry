class AddWardrobeRefsToGorClothing < ActiveRecord::Migration
  def change
  	add_reference :gor_clothings, :wardrobe, index: true, foreign_key: true 
  end
end
