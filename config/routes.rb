 Rails.application.routes.draw do
  

  # get 'event_tickets_api/create'

  # get 'event_tickets_api/update'

  root               'sessions#new'
  
  get '/gor_main', to: 'gor_main#main'
  get '/help', to: 'gor_main#help'
  get '/contact', to: 'gor_main#contact'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#create'
  get '/edit', to: 'users#edit'
  get '/sessions/:page' => "sessions#show"
  # get '/soundcloud/oauth-callback', to: 'sessions#omniauth_create'


  # resources :users do
  # 	resources :event_tickets, :songs, :gor_clothing, :preferences
  # end

  resources :preferences do
  	member do
  		get :favorited_outfits, :favorited_songs, :favorited_events
  	end
  end

  resources :gor_clothing do
  	resources :images, only: [:show, :preview]
  end

  resources :event_tickets do
  	resources :performers, :artists
  end

  resources :artists do
  	resources :songs
  end


 constraints subdomain: 'api' do
 	namespace :api, path: '/' do
 		resources :event_tickets
 	end
 end

 namespace :admin do
  	resources :preferences do
  		resources :event_tickets, :songs, :gor_clothing
  	end
  	
  	resources :gor_clothing do
  		resources :images, shallow: true
  	end
  
	resources :event_tickets do
		resources :performers, :artists
	end

 end

end

#   get '/signup', to: 'users#new'

#   namespace :admin do
#   	resources :gor_clothings
#   end  	

# constraints subdomain: 'api' do
# 	namespace :api, path: '/' do
# 		resources :event_tickets
# 	end
# end

# # except gor_clothings#show
  
# resources :users
#  resources :songs

