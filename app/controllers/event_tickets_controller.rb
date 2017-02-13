class EventTicketsController < ApplicationController
	def index #SuggEvents
		Event_tickets.joins(:artists, :performers, :teams).where(status: 'favorited')
	end

	def create
		@ImmEvents = Event_tickets.GiveMeImmEvents
		@PopularFests = Event_tickets.ParsePopularFests
	end

	def update
		@Event_ticket = Event_ticket.find(params[:id])
		if @Event_ticket.unfavorited?
			@Event_ticket.status = :favorited
			@Event_ticket.save
			current_user.subscribe_to(@Event_ticket)
			#if associated model is artist, performer or team, figure out how to increment or decrement fav_count or switch status
		else
			@Event_ticket.favorited!
		end
	end

# class EventTicketsApiController < ApplicationController
  
#   def index
#   	@Event_ticketsImm = Event_tickets_api.GiveMeImmEvents
#   	@Event_ticketsPopular = Event_tickets_api.ParsePopularFests
#   end
  
#   def create
#   	@search_item = params[:looking_for] || {}
#   	@events = Event_tickets_api.for(@search_item)
#   end

#   def update
  	
#   end

#   def destroy

#   end

#   private

#   	params.require(:event_tickets_api).permit(:looking_for)
# end

end