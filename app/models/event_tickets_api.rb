
require 'rubygems'
require 'httparty'
require 'pry'
require 'time'
require 'json'
require 'URI'

class Event_tickets

	class << self; attr_accessor :last_time_events_checked, :til_eight_months end

	include HTTParty

	base_uri 'https://api.seatgeek.com'
	default_params :client_id => ENV['MYCLIENTID']
	format :json

	def initialize(current_time, eight_months_from_now)
	 	self.class.current_time = current_time
	 	self.class.eight_months_from_now = eight_months_from_now
	end
 
 	def self.GiveMeImmEvents(genre, datetime_order, score_order, type_of_event, score_gte, datetime_local_gte, datetime_local_lte, bool, range)
 		get('/2/events', :query => {"genres.slug" => genre, "sort" => {"datetime_order" => datetime_order, "score_order" => score_order}, "taxonomies.name" => type_of_event, "score.gte" => score_gte, "datetime_local.gte" => datetime_local_gte, "datetime_local.lte" => datetime_local_lte, "geoip" => bool})
 	end

 	def self.ParseSportingEvents(type_of_event,  datetime_order, score_order, score_gte, datetime_local_gte, datetime_local_lte)
 		get('/2/events', :query => {"taxonomies.name" => type_of_event, "sort" => {"datetime_order" => datetime_order, "score_order" => score_order}, "score.gte" => score_gte, "datetime_local.gte" => datetime_local_gte, "datetime_local.lte" => datetime_local_lte})
 	end

 	def self.for term
 		get('/2/events', :query => {"q" => term})
 	end
	
	def self.event_forecast
		@last_time_events_checked = Time.now.strftime("%Y-%m-%d")
	end

	def self.til_eight_months
		@til_eight_months = (Time.now + (60 * 60 * 24 * 240)).strftime("%Y-%m-%d") 
	end
end

	# puts Event_tickets.GiveMeImmEvents('pop', 'datetime_local.asc', 'score.desc', 'concert', '0.7', Event_tickets.event_forecast, Event_tickets.til_eight_months, true, '100m')	
    	# puts Event_tickets.ParseSportingEvents('sports', 'datetime_local.asc', 'score.desc', '0.7', Event_tickets.event_forecast, Event_tickets.til_eight_months)
	# puts Event_tickets.for('Ariana Grande')