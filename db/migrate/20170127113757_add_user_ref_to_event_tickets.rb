class AddUserRefToEventTickets < ActiveRecord::Migration
  def change
  	add_reference :event_tickets, :user, index: true, foreign_key: true
  end
end
