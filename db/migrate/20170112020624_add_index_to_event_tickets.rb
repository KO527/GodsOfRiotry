class AddIndexToEventTickets < ActiveRecord::Migration
  def change
  	add_index :event_tickets, [:performer_name, :name, :happening], unique: true
  	add_index :event_tickets, [:artist_name, :name, :happening], unique: true
  	add_index :event_tickets, [:home_team, :away_team, :happening], unique: true
  	add_index :event_tickets, [:away_team, :away_team, :happening], unique: true
  end
end
