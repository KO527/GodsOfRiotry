class AddColumnsToEventTickets < ActiveRecord::Migration
  def change
    add_column :event_tickets, :num_of_times_favorited, :integer
    add_column :event_tickets, :venue, :string
    add_column :event_tickets, :happening, :datetime
    add_column :event_tickets, :name, :string
  end
end
