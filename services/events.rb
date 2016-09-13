require 'date'

require 'active_support/all'
require 'active_support/concern'

class EventsProcessor

	include HTTParty

	extend 'ActiveSupport::Concern'

	base_uri 'api.seatgeek.com'  
	default_params api_key: 'Mzk5NjE5MXwxNDUwNDExNzQ3'

	def initialize(sort_by, type_of_event, datetime_local_gte, datetime_less_than, geoip, range)
		@options = {query: {sort: '#{sort_by}', taxonomies.name: '#{type_of_event}', datetime_local.gte: '#{datetime_local_gte}', datetime_local.lte: '#{datetime_less_than}', geoip: '#{geoip}', range: '#{range}' }}
	end

	def GiveMeImmEvents
		date do |date_now, date_sixmonths|
		self.class.get('/2/events?q=hip-hop', @options)
		end
	end

          def ParsePopularFests
          		date do |date_now, date_sixmonths|
          		self.class.get('/2/events?q=techno', @options)
          		end
          end

          def SuggEvents
          		date do |date_now, date_sixmonths|
          		self.class.get('/2/events?q=rap', @options)
          		end
          	end

          	#sample parameters for instantiation of class
          	# {'datetime_local.asc', 'score.desc'}, {'concert', 'music_festival'}, 'date_now', 'date_sixmonths', true, '100mi'

	private

		def date(date_now: nil)
			@date_now = date_now !! DateTime.now 
			yield @date_now unless DateTime.now.strptime('%I:%M:%S %p') < "03:30:00 AM"
			yield @date_sixmonths = @date_now.advance(months: 6)
		end

		def ElimDupl(n, data)

			
		end
end


