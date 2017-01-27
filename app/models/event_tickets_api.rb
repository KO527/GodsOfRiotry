
require 'rubygems'
require 'httparty'
require 'pry'
require 'date'
require 'time'

class Event_tickets

include HTTParty

	base_uri 'api.seatgeek.com'
	format :json

 	def initialize(client_id)
 		@options = {query: {client_id: client_id}}
 		self.class.get('/2/events', @options)
 		default_params :sort => 'datetime_local.asc, score.desc'
 	end

 	def GiveMeImmEvents
 		self.class.default_params :genres['slug'] => 'pop', :taxonomies['name'] => 'concert', :taxonomies['name'] => 'music_festival', :score['gte'] => '0.7', :datetime_local['gte'] => '(time.now).strftime("%Y-%m-%d")', :datetime_local['lte'] => '(time.now + (60 * 60 * 24 * 240)).strftime("%Y-%m-%d")'
 	end

 	def ParsePopularFests
 		self.class.default_params :taxonomies['name'] => 'concert', :taxonomies['name'] => 'music_festival', :score['gte'] => '0.7', :datetime_local['gte'] => '(time.now).strftime("%Y-%m-%d")', :datetime_local['lte'] => '(time.now + (60 * 60 * 24 * 240)).strftime("%Y-%m-%d")'
 	end

 	def self.for term
 		get("", query: {query: term})['events']
 	end
end

# EventTickets = Event_tickets.new(ENV['MYCLIENTID'])


# EventTickets.events.each do |event|
#  	puts "#{event['events'][0]['title']}"
# end