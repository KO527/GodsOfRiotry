class AddStandaloneToGorClothing < ActiveRecord::Migration
  def change
  	add_column :gor_clothings, :standalone, :boolean, :default => false
  end
end
