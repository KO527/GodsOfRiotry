class RemovePerformerNameFromEventTickets < ActiveRecord::Migration
  def change
  	remove_column :event_tickets, :performer_name
  end
end
