 Rails.application.routes.draw do
  

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get 'event_tickets_api/create'

  # get 'event_tickets_api/update'

  root               'sessions#new'
  
  get '/help', to: 'gor_main#help'
  get '/contact', to: 'gor_main#contact'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # get '/sessions/:page' => "sessions#show"
  get '/edit', to: 'users#edit'

  # get '/soundcloud/oauth-callback', to: 'sessions#omniauth_create'


   resources :users do
   	resources :event_tickets
   	resources :gor_clothing, except: [:new]
   	resources :playlist, except: [:index, :show]
   	member do
   		resources :preferences, only: [:index, :update, :create, :destroy]
   	end
   end

   resource :playlist do
   	member do
	   	patch 'change_up' #Randomize what gets played while keeping kept_songs in the playlist
	end

	# def change_up
	# @playlist = playlist.find_by(params[:id])
	# @songs = @playlist.songs.all
	# @songs.each do |song|
   	#  	if song.kept_song!
   	# 		songs_to_be_deleted << song
   	# 	else
   	# 	 	nextl
   	# 	end
   	# end
          #     songs_to_be_deleted.destroy  => collapse songs in playlist through javascript
   	# end
   	#

   	resources :songs do
   		member do
   			post 'keep_song' #mark as kept_song
   			# def keep_song
   				#update preferences
   		end
   	end
   	# [:destroy]
   end


  resources :preferences, only: [:index, :update, :create, :destroy] do
  		resources :gor_clothing, except: [:show, :new, :edit] do #create, destroy, index, update
  			collection do
  				patch 'update_wardrobe'
  				get 'saved_wardrobes'
  			end
  		end
  		resources :songs, except: [:show, :new, :edit]
  		resources :event_tickets, except: [:edit]
  end

  resources :gor_clothing, except: [:new] do
  	member do
  		resources :images, only: [:index, :show, :preview]
  	end
  end

  resources :event_tickets do
  	collection do
  		get 'search'
  	end
  	# resources :performers, except: [:new, :edit, update] -> will create, destroy, show under preferences
  	# resources :artists, except: [:new, :edit, update]
  end

  # resources :artists do
  # 	resources :songs
  # end


 namespace :admin do
  	resources :preferences do
  		member do
  			resources :event_tickets, :songs, :gor_clothing
  		end 
  	end
  	
  	#Set admin restrictions
  	# Linked app/views/gor_clothing/image_setup.html

  	resources :gor_clothing, only: [:new, :create, :edit, :update, :destroy] do
  		member do
  			resources :images, only: [:new, :show, :edit, :update, :destroy, :index, :preview] #Images controller...how do we specify?
  		end
  	end


  	#image upload --> new --> triggered by carrier_wave uploader--> preview action --> render admin_gor_clothing_image_path alert(is show picture ok?)
  	#save image --> create --> 
  	
  	# def gor_clothing
  	# 	params.require(gor_clothing_params).permit(:name, :description, :size, :colors_available, :gender, :picture)
  	# end

  	resources :users do
  		member do
			resources :playlists, only: [:create, :destroy, :show, :index]
			resources :gor_clothing # Designed to specifically check what user enjoys
  		end
	end

  
	# resources :event_tickets do
	# 	resources :performers, :artists
	# end

 end


end

#   get '/signup', to: 'users#new'



# # except gor_clothings#show
  

