class AddPerformerNameToEventTickets < ActiveRecord::Migration
  def change
  	add_column :event_tickets, :performer_name, :string
  end
end
