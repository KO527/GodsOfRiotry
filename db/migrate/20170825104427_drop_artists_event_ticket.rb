class DropArtistsEventTicket < ActiveRecord::Migration
  def change
  	drop_table :artists_event_ticket
  end
end
