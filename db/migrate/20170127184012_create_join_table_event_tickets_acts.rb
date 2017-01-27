class CreateJoinTableEventTicketsActs < ActiveRecord::Migration
  def change
  	create_join_table :event_ticket, :acts do |t|
	       t.index [:event_ticket_id, :act_id]
	       t.index [:act_id, :event_ticket_id]
    	end
  end
end
