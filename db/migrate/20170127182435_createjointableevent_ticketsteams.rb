class CreatejointableeventTicketsteams < ActiveRecord::Migration
  def change
  	create_join_table :event_ticket, :teams do |t|
	       t.index [:event_ticket_id, :team_id]
	       t.index [:team_id, :event_ticket_id]
    	end
  end
end
