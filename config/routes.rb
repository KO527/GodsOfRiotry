 Rails.application.routes.draw do
  

  get 'event_tickets_api/create'

  get 'event_tickets_api/update'

  get 'event_tickets_api/destroy'

  root               'sessions#new'
  
  get '/gor_main', to: 'gor_main#main'
  get '/help', to: 'gor_main#help'
  get '/contact', to: 'gor_main#contact'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#create'
  get '/edit', to: 'users#edit'
  get '/sessions/:page' => "sessions#show"
  # get '/soundcloud/oauth-callback', to: 'sessions#omniauth_create'

  resources :users do
  	member do
  		get :wardrobe
  	end
  end

  get '/signup', to: 'users#new'

  namespace :admin do
  	resources :gor_clothings
  end  	

constraints subdomain: 'api' do
	namespace :api, path: '/' do
		resources :event_tickets
	end
end

# except gor_clothings#show
  
resources :users
   # resources :songs

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
