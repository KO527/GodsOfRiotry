 Rails.application.routes.draw do
  

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get 'event_tickets_api/create'

  # get 'event_tickets_api/update'

  root 		'application#root'
  # 'sessions#new'
  
  get '/help', to: 'gor_main#help'
  get '/contact', to: 'gor_main#contact'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # get '/sessions/:page' => "sessions#show"
  get '/edit', to: 'users#edit'

  # get '/soundcloud/oauth-callback', to: 'sessions#omniauth_create'


   resources :users, except: [:index] do
   	resources :wardrobes
   	resources :playlist, except: [:index, :show]
   end

   resource :playlist do
   	member do
	   	patch 'change_up' #Randomize what gets played while keeping kept_songs in the playlist
	end

   	resources :songs, except: [:edit, :update] do
   		member do
   			post 'keep_song'
   		end
   	end
   end

  resources :preferences, only: [:index, :create, :destroy]

  resources :wardrobes, only: [:update, :index, :destroy, :detail]

  resources :gor_clothing, except: [:new] do
  	member do
  		resources :images, only: [:index, :show, :preview]
  	end
  end

  resources :possible_matches, only: [:show, :detail] do
  	member do
  		get :visible_gor_clothing, to: :show
  	end
  end

  get ':performer_name', to: 'event_tickets#artist_events', as: :artist_events

  resources :event_tickets, only: [:index, :show] do
  	 collection do
  	 	get ':input' => 'event_tickets#search', as: :search
  	 end
  end

  namespace :admin do

  	resources :gor_clothing, except: [:show] do
  		post :preview, on: :new
  		member do
  			get '/', to: :detail
  			resources :possible_matches do
  				match :create, to: 'possible_matches#create', via: [:post], on: :collection
  				match :destroy, to: 'possible_matches#destroy', via: [:delete], on: :collection
  			end
  			resources :images, except: [:edit, :update] do
  				match :edit_some, to: 'images#edit_some', via: [:get], on: :collection
  				match :destroy, to: 'images#destroy', via: [:delete], on: :collection
  				get :preview, on: :new
  			end
  		end
  	end

  	#image upload --> new --> triggered by carrier_wave uploader--> preview action --> render admin_gor_clothing_image_path alert(is show picture ok?)
  	#save image --> create --> 
  	

  	resources :users do
  		get 'saved_wardrobes'
  		member do
			resources :playlists, only: [:create, :destroy, :show, :index]
  		end
	end

  end


end

