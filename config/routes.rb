Elenlace::Application.routes.draw do
  get "demo" => "demo#show"
  get "home" => "pages#home", as: :home
  get "eventos" => "pages#events"
  get "gallery" => "pages#gallery"
  get "log_out" => "wedding_sessions#destroy"
  post 'wedding_sessions/:id' => 'wedding_sessions#create', as: :sessions
  post "info" => "pages#info"

  resource :wedding, only: [:edit, :update]
  resources :pictures do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  resources :events
  resources :comments, only: [:create, :index, :destroy]
  resources :notifications, only: [:index, :show] do
    member do
      post 'read'
    end
    collection do
      post 'read_all'
    end
  end
  resource :account, only: [:show, :edit, :update]
  resources :songs do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  resources :messages do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  resources :dances


  resources :guests do
    member do
      get 'messages'
      get 'pictures'
    end
  end

  resources :tables

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#landing'

  namespace :admin do
    get '', to: 'dashboard#index', as: :dashboard
    resources :weddings
  end

  scope '/admin' do
    get 'log_in' => 'clearance/sessions#new', as: :admin_log_in
  end

  get "/:id" => "wedding_sessions#new"

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
