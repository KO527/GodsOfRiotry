class SoundcloudController < ApplicationController

    def show
      @client = SoundCloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'], :client_secret => ENV['SOUNDCLOUD_CLIENT_SECRET'], :username => ENV['USERNAME'], :password => ENV['PASSWORD'])
      render @playlist = @client.get('me/playlists').first
    end       
       
end
