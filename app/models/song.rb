class Song < ActiveRecord::Base
	enum status: [:favorited, :unfavorited]
	
	belongs_to :artists, foreign_key: "artist_id"
	belongs_to :preferences, foreign_key: "preference_id"
	belongs_to :playlist, foreign_key: "playlist_id"

	validates :name, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
	validates :genre, presence: true, inclusion: {in: %w(#list_of_genres), message: "%{value} is not a valid genre"}
	validates :fav_count, presence: true, numericality: {only_integer: true}, allow_nil: true

	# scope :distinct_songs -> {where.not(subscriber_id.favorited_songs)}
	
	private
	
		def StatusCountUpdate
			# preferences = song.preferences.all
			song = Song.find_by(params[:id])
			song.fav_count.increment! && song.favorited! if song.unfavorited? == true
			song.reload
		end


	# associate models
	#last 10 favorited songs
	# scope :song_select_range -> {where(fav_count: song_avg_range - 10 .. song_avg_range + 10)}		
	# song_avg_range = subscriber_id.average("favorited_songs.fav_count") # last 10 favorited songs

end
