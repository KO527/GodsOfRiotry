class AddGenderToGorClothing < ActiveRecord::Migration
  def change
  	add_column :gor_clothings, :gender, :integer, default: 0, null: false
  end
end
