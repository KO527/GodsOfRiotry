class AddArtistNameToEventTickets < ActiveRecord::Migration
  def change
  	add_column :event_tickets, :artist_name, :string
  end
end
