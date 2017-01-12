class RemoveNumOfTimesFavoritedFromEventTickets < ActiveRecord::Migration
  def change
  	remove_column :event_tickets, :num_of_times_favorited, :integer
  end
end
