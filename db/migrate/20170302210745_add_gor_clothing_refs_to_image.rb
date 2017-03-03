class AddGorClothingRefsToImage < ActiveRecord::Migration
  def change
  	add_reference :images, :gor_clothing, index: true, foreign_key: true
  end
end
