class Playlist < ActiveRecord::Base
	has_many :songs
	has_many :favorited_songs, -> {where status: favorited}, class_name: "Song"
	belongs_to :subscriber_id, class_name: "User", foreign_key: "user"

	# Playlist.joins()
	
	private

		# fav_artist_songs_select  = Songs.where(artists: user.favorited_artists).take(2)
		# recommended_song_select = Songs.joins(:preferences).merge(Preference.with_shared_song_interests.distinct_songs).take(2)
		# fav_events_artist_song_select = Songs.where(artists: {events: user.favorited_events}).take(2)

		def SetupPlaylist

			user = User.find_by(params[:user_id])
	
			#Figure out how to setup a playlist for user's shopping experience...etc randomized mixture of users preconcieved taste and creator's recommendation list
			Playlist.clear
			Playlist << Songs.where(artists: user.favorited_artists).take(2)
			if user.favorited_events.favorited_artists.any?
				Playlist << Songs.where(artists: {events: user.favorited_events}).take(2)
			else
				Playlist << Songs.where(artists: user.favorited_artists).take(2)
			end
			Playlist << Songs.joins(:preferences).merge(Preference.with_shared_song_interests.distinct_songs).take(2)
		end

		# def shuffle_playlist
		
		# 	self.class.unscope
		# 	Playlist.reload

		# 	Playlist << self.class.fav_artist_song_select			
		# 	#Reshuffles songs so that new playlist comes into play
		# end	

end
