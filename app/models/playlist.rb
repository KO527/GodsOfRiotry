class Playlist < ActiveRecord::Base
	has_many :songs
	has_many :favorited_songs, class_name: "Song"
	belongs_to :subsriber_id, class_name: "User"

	Playlist.joins(:songs).merge(Song.users_with_shared_song_interests.favorited_songs.distint_songs.song_select_range.take(2))

	private


		def SetupPlaylist
			#Figure out how to setup a playlist for user's shopping experience...etc randomized mixture of users preconcieved taste and creator's recommendation list
			
		end

		def shuffle_playlist
		
			recommend_song_select = users_with_shared_song_interests.favorited_songs.distinct_songs.song_select_range.take(2)

			self.class.unscope
			Playlist.reload

			Playlist << self.class.fav_artist_song_select			
			#Reshuffles songs so that new playlist comes into play
		end	

end
