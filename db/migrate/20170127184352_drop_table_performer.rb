class DropTablePerformer < ActiveRecord::Migration
  def change
  	drop_table :performers
  end
end
