class EventTicketsController < ApplicationController
	require 'Time'
	require '../models/event_tickets_api'
	
	respond_to :html, :js

	layout 'main_display'

	attr_accessor :performer_name, :search

	def index
		@ImmEvents = Event_tickets.GiveMeImmEvents
		@PopularFests = Event_tickets.ParsePopularFests
	end

	def artist_events
		@Event_tickets = Event_tickets.EventsByArtist.find(params[:performer_name])
	end

	def search
		@Event_tickets = Event_tickets.for(params[:search])
	end

	private 


		def performer_name
			@performer_name
		end

		def search
			@search
		end
end