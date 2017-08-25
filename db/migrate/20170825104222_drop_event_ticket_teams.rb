class DropEventTicketTeams < ActiveRecord::Migration
  def change
  	drop_table :event_ticket_teams
  end
end