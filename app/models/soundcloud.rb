require 'soundcloud'

client = soundcloud.new(:client_id => '96abd1b5c427e0147b693bd5b3065124',
			   :client_secret => '76e4cdc8cd2ca531e340c6e765bf2f59',
			   :redirect_uri => 'http://godsofriotry.com/_songs.html.erb')

redirect_to client.authorize_url()