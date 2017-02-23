class AddColorsAvailableToGorClothing < ActiveRecord::Migration
  def change
  	add_column :gor_clothings, :colors_available, :string
  end
end
