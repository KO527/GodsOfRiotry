class AddFavoriteTallyToEventTickets < ActiveRecord::Migration
  def change
  	add_column :event_tickets, :favorite_tally, :integer
  end
end
