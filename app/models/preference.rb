class Preference < ActiveRecord::Base

	belongs_to :subscriber_id, class_name: "User", primary_key: "user_id"
	has_many :favorited_artists, -> {where status: favorited}, class_name: "Artist", dependent: :destroy
	has_many :favorited_songs, -> {where status: favorited}, class_name: "Song", dependent: :destroy
	has_many :favorited_events, -> {where status: favorited}, class_name: "Event_ticket",  dependent: :destroy
	has_many :favorited_outfits, -> {where status: favorited}, class_name: "Gor_clothing", dependent: :destroy

	validates :subscriber_id, presence: true
	validates :fav_count, presence: true, numericality: {integer: true}, allow_nil: true


	#Scope is employed to help user find other users with similar tastes
	#FIgure out how to come up with user's preferences that share three of the subscriber_id's favorited songs
	scope :with_shared_song_interests -> {where(preferences: :subscriber_id.favorited_songs.exists?(3))} #alternative exists?(2)


	def how_many_fav_outfits
		self.favorited_outfits.count
	end

	def how_many_fav_events
		self.favorited_events.count
	end

	def how_many_fav_songs
		self.favorited_songs.count
	end

	def how_many_fav_artists
		self.favorited_artists.count
	end


	def num_of_preferences
		preference = Preference.find_by(params[:id])
		preference.fav_count = how_many_fav_artists + how_many_fav_songs + how_many_fav_outfits + how_many_fav_events
		preference.reload
	end
	
	private 
		#show for admin preference controller index action
		def show_recent_list
			preference = Preference.find_by(params[:id])
			preference.order('created_at desc').limit(25) 
		end

end
