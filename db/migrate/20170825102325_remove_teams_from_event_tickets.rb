class RemoveTeamsFromEventTickets < ActiveRecord::Migration
  def change
  	remove_column :event_tickets, :away_team
  	remove_column :event_tickets, :home_team
  end
end
