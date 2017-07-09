JsRoutes.setup do |config|
	config.default_url_options = {:format => "json", :trailing_slash => true, :protocol => "https", :host => "localhost.com", :port => 3000}
end