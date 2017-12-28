class PlaylistController < ApplicationController
    before_action :show, [:retrieve_playlist, :create]

    def show
      render @playlist = @client.get('me/playlists').first  
    end

    def create
       @playlist.save
    end

    def destroy
      @playlist = Playlist.find(params[:id])
      @playlist.destroy
    end

    def retrieve_playlist
        @client = SoundCloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'], :client_secret => ENV['SOUNDCLOUD_CLIENT_SECRET'], :username => ENV['USERNAME'], :password => ENV['PASSWORD'])
    end

end
