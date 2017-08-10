class PreferencesController < ApplicationController

	def show
		# @songs = User.find(params[:uid])  shows songs that user has a preference for...songs replayed etc, etc
	end
	
	def create
		
	end

	private
		
		def num_of_preferences
			self.fav_count = how_many_fav_artists + how_many_fav_songs + how_many_fav_outfits + how_many_fav_events
			puts %{preference.fav_count}
		end

		def show_recent_list
			preference = Preference.find_by(params[:id])
			preference.order('created_at desc').limit(25)
		end

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
end
