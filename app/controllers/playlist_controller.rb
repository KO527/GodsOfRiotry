class PlaylistController < ApplicationController


	def change_up
		 @playlist = playlist.find_by(params[:id])
		 @songs = @playlist.songs.all
		 @songs.each do |song|
	   	  	if song.kept_song!
	   	 		songs_to_be_deleted << song
	   	 	else
	   	 	 	nextl
	   	 	end
	   	 end
	               # songs_to_be_deleted.destroy  => collapse songs in playlist through javascript
   	end

	
end
