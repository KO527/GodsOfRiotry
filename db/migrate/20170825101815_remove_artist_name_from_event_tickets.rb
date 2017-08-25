class RemoveArtistNameFromEventTickets < ActiveRecord::Migration
  def change
  	remove_column :event_tickets, :artist_name
  end
end
