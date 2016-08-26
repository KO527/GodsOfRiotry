class AddDescriptionToGorClothings < ActiveRecord::Migration
  def change
    add_column :gor_clothings, :description, :text
  end
end
