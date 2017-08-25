class RemovePerformerIdFromEventTickets < ActiveRecord::Migration
  def change
  	remove_column :event_tickets, :performer_id
  end
end
