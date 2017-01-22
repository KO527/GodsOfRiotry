class AddFavCountToEventTickets < ActiveRecord::Migration
  def change
  	add_column :event_tickets, :fav_count, :integer
  end
end
