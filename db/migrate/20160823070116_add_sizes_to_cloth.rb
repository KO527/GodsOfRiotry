class AddSizesToCloth < ActiveRecord::Migration
  def change
  	add_column :gor_clothings, :sizes, :float
  end
end
