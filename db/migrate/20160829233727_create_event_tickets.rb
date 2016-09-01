class CreateEventTickets < ActiveRecord::Migration
  def change
    create_table :event_tickets do |t|

      t.timestamps null: false
    end
  end
end
