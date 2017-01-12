class EventTicket < ActiveRecord::Base

	has_many :artists
	has_many :performers
	has_many :teams
	belongs_to :subscriber_id, class_name: "User"

	validates :num_of_times_favorited, presence: true, numericality: {only_integer: true}
	validates :venue, :presence: true, length: {maximum: 255}
	validates :name, presence: true, length: {maximum: 50}
	validates :happening, presence: true, format: {}


	private 

		# def GiveMeImmEvents
		# 	url = 'https://api.seatgeek.com/2/events?client_id=Mzk5NjE5MXwxNDUwNDExNzQ3&genres.slug=pop&sort=datetime_local.asc&sort=score.desc&taxonomies.name=concert&taxonomies.name=music_festival&score.gte=0.7&datetime_local.gte=2017-01-01&datetime_local.lte=2017-08-01&geoip=true&range=100mi'	
		# 	get url	
		# end

		# def ParsePopularFests
		# 	url = 'https://api.seatgeek.com/2/events?sort=datetime_local.asc&sort=score.desc&taxonomies.name=concert&taxonomies.name=music_festival&score.gte=0.6&datetime_local.gte=2016-09-01&datetime_local.lte=2016-12-31&geoip=true'
		# 	get url 
		# end

		# def SuggEvents
		# 	url = 'https://api.seatgeek.com/2/events?q=rap&sort=datetime_local.asc&sort=score.desc&taxonomies.name=concert&taxonomies.name=music_festival&datetime_local.gte=2016-09-01&datetime_local.lte=2016-12-31&geoip=true&range=100mi'
		# 	get url
		# end

end
