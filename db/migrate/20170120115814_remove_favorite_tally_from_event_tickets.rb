class RemoveFavoriteTallyFromEventTickets < ActiveRecord::Migration
  def change
  	remove_column :event_tickets, :favorite_tally
  end
end
