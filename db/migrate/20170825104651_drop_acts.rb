class DropActs < ActiveRecord::Migration
  def change
  	drop_table :acts
  end
end
