class EventTicketsController < ApplicationController
	require 'Time'
	require '../models/event_tickets_api'
	
	before_filter :format_time, :only => [:create]
	respond_to :html, :js
	attr_accessor :performer_name

	def index #SuggEvents
		Event_tickets.joins(:artists, :performers, :teams).where(status: 'favorited')
	end

	def index
		@ImmEvents = Event_tickets.GiveMeImmEvents
		@PopularFests = Event_tickets.ParsePopularFests
	end

	def artist_events
		@Event_tickets = Event_tickets.EventsByArtist.find(params[:performer_name])
	end

	private

		def format_time
			happening = params[:happening]
			params[:happening] = Time.strftime(happening, "%Y-%m-%d")
		end

end