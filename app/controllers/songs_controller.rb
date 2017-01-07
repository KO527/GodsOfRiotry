class SongsController < ApplicationController

before_action :admin_user	only: [:show]

def show
	# @songs = User.find(params[:uid])  shows songs that user has a preference for...songs replayed etc, etc
end

def SetupPlaylist
	#Figure out how to setup a playlist for user's shopping experience...etc randomized mixture of users preconcieved taste and creator's recommendation list
	#
end

def favorite
	#Allow a user to favorite a song and save the song
end

def shuffle
	#Reshuffles songs so that new playlist comes into play
end

end
