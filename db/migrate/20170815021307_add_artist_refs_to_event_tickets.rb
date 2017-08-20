class AddArtistRefsToEventTickets < ActiveRecord::Migration
  def change
 	add_reference :event_tickets, :artist, type: :string
  end
end
