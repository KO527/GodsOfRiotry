class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :json

  include UsersHelper
  include SessionsHelper
  include GorClothingHelper
  include PossibleMatchesHelper

  before_action :setup_initial_playlist, :store_access_token, only: [:root]

  def root
  	render 'layouts/main_display'
  end

  private

  	def setup_initial_playlist
		client = Soundcloud.new(:client_id => ENV["SOUNDCLOUD_CLIENT_ID"],
			    :client_secret => ENV["SOUNDCLOUD_CLIENT_SECRET"],
			    :redirect_uri => "GodsOfRiotry.com/callback",
			    :response_type => 'code')
		client.authorize_url(:grant_type => 'authorization_code', :scope => 'non_expiring')
	end
	
	def store_access_token
	 	client = Soundcloud.new(:client_id => ENV["SOUNDCLOUD_CLIENT_ID"],
	 				    :client_secret => ENV["SOUNDCLOUD_CLIENT_SECRET"],
	 				    :redirect_uri => "GodsOfRiotry.com/callback")
	 	access_token = client.exchange_token(:code => params[:code])
	 	ENV["ACCESS_TOKEN"] = access_token["access_token"]
	end

end