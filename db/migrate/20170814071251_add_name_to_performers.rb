class AddNameToPerformers < ActiveRecord::Migration
  def change
  	add_column :performers, :name, :string
  end
end
