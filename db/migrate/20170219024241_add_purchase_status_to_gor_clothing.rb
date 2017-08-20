class AddPurchaseStatusToGorClothing < ActiveRecord::Migration
  def change
  	add_column :gor_clothings, :purchase_status, :integer, null: false
  end
end
