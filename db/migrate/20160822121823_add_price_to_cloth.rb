class AddPriceToCloth < ActiveRecord::Migration
  def change
  	add_column :gor_clothings, :price, :float
  end
end
