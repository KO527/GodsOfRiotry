class CreateJoinTableEventTicketArtists < ActiveRecord::Migration
  def change
  	create_join_table :event_ticket, :artists do |t|
	       t.index [:event_ticket_id, :artist_id]
	       t.index [:artist_id, :event_ticket_id]
    	end
  end
end
