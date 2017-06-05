class EventTicketsController < ApplicationController
	require 'Time'
	require '../models/event_tickets_api'
	
	respond_to :html, :js
	layout 'event_tickets'

	attr_accessor :performer_name, :search

	layout 'event_tickets'

	def index
		@ImmEvents = Event_tickets.GiveMeImmEvents
		@PopularFests = Event_tickets.ParsePopularFests
	end

	def artist_events
		@Event_tickets = Event_tickets.EventsByArtist(params[:performer_name])
	end

	def search
		@Event_tickets = Event_tickets.for(params[:input])
	end

end