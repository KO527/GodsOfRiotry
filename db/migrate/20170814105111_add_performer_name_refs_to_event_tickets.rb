class AddPerformerNameRefsToEventTickets < ActiveRecord::Migration
  def change
	add_reference :event_tickets, :performer, type: :string
  end
end
