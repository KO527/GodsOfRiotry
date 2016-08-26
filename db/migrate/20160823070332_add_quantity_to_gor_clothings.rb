class AddQuantityToGorClothings < ActiveRecord::Migration
  def change
  	add_column :gor_clothings, :quantity, :integer
  end
end
