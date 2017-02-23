class AddQuantityToGorClothings < ActiveRecord::Migration
  def change
  	add_column :gor_clothings, :quantity, numericality: {only_integer: true}
  end
end
