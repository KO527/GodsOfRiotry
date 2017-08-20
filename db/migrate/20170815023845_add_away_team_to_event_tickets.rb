class AddAwayTeamToEventTickets < ActiveRecord::Migration
  def change
  	add_column :event_tickets, :away_team, :string
  end
end
