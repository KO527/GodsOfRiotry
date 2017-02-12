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


end