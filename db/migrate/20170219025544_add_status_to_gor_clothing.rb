class AddStatusToGorClothing < ActiveRecord::Migration
  def change
  	add_column :gor_clothings, :status, :integer, default: 0, null: false
  end
end
