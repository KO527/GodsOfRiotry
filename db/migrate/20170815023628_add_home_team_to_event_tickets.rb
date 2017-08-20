class AddHomeTeamToEventTickets < ActiveRecord::Migration
  def change
  	add_column :event_tickets, :home_team, :string
  end
end
