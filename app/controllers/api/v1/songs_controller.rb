class SongsController < ApplicationController

	before_action :is_admin?, only: [:show]

	
	def favorite
		#Allow a user to favorite a song and save the song
	end

# def connect

# end

# def connected

# end

# def destroy

# end


end
