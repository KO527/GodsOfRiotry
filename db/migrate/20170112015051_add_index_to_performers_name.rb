class AddIndexToPerformersName < ActiveRecord::Migration
  def change
  	add_index :performers, :name
  end
end
