class PlaylistController < ApplicationController

	# associate models
	
	def SetupPlaylist
		#Figure out how to setup a playlist for user's shopping experience...etc randomized mixture of users preconcieved taste and creator's recommendation list
		
	end

	def shuffle_playlist
		song_avg_range = current_user.average("favorited_songs.fav_count")

		scope :users_with_shared_song_interests -> {User.where(User.preferences: :current_user.favorited_songs).distinct}
		scope :song_select_range -> {where(songs: {fav_count: song_avg_range - 10 .. song_avg_range + 10})}
		scope :distinct_songs -> {where.not(current_user.favorited_songs)}

		recommend_song_select = users_with_shared_song_interests.favorited_songs.distinct_songs.song_select_range.take(2)

		fav_artist_song_select = Songs.where(songs: {artists: current_user.preferences.favorited_artists}).take(2)
		#Reshuffles songs so that new playlist comes into play
	end
end
