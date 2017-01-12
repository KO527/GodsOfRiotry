class AddIndexToEventTicketsHappening < ActiveRecord::Migration
  def change
  	add_index :event_tickets, :happening, unique: true
  end
end
