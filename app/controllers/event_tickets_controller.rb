class EventTicketsController < ApplicationController
	require 'Time'
	require '../models/event_tickets_api'
	before_filter :format_time, :only => [:create]
	respond_to :html, :js

	def index #SuggEvents
		Event_tickets.joins(:artists, :performers, :teams).where(status: 'favorited')
	end

	def index
		@ImmEvents = Event_tickets.GiveMeImmEvents
		@PopularFests = Event_tickets.ParsePopularFests
	end

	private

		def format_time
			happening = params[:happening]
			params[:happening] = Time.strftime(happening, "%Y-%m-%d")
		end

end