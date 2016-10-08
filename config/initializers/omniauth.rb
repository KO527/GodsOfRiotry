OmniAuth.config.full_host = "http://localhost:3000"

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider "soundcloud", ENV["SOUNDCLOUD_CLIENT_ID"], ENV["SOUNDCLOUD_CLIENT_SECRET"]
end