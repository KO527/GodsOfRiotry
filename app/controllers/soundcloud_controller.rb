class SoundcloudController < ApplicationController

	def connect
		client = Soundcloud.new(:client_id => ENV["SOUNDCLOUD_CLIENT_ID"],
					    :client_secret => ENV["SOUNDCLOUD_CLIENT_SECRET"],
					    :redirect_uri => "GodsOfRiotry.com/callback",
					    :response_type => 'code')

		redirect_to client.authorize_url(:grant_type => 'authorize_code', :scope => 'non-expiring')
	end

	def connected
		client = Soundcloud.new(:client_id => ENV['SOUNDCLOUT_CLIENT_ID'],
					    :client_secret => ENV["SOUNDCLOUD_CLIENT_SECRET"],
					    :redirect_uri => "GodsOfRiotry.com/callback")
		access_token = client.exchange_token(:code => params[:code])
		client = Soundcloud.new(:access_token => access_token["access_token"])

		soundcloud_user = client.get('/me')
		unless User.where(:soundcloud_user_id => soundcloud_user['id']).present?
			User.remove_soundcloud_credentials
			User.create_from_soundcloud(soundcloud_user, access_token)
		end
		sign_in_user = User.where(:soundcloud_user_id => soundcloud_user['id'])

		session[:user_id] = sign_in_user.first.id
		redirect_to root_url, notice: "#{soundcloud_user.username}, Signed in!"
	end
	
	private

		def resolve_and_add_tracks_to_playlist
					
		end
end
