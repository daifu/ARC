ARC4EM::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
      
  root to: 'static_pages#home'

  get '/signup',  to: 'users#new'
  get '/signin',  to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
      
  get '/about_us',  to: 'static_pages#about_us'
  get '/program',   to: 'static_pages#program'
  get '/workshop',  to: 'static_pages#workshop'
  get '/partners',  to: 'static_pages#partners'
  get '/travel',    to: 'static_pages#travel'
  get '/contact_us',to: 'static_pages#contact_us'
  get '/coupons/new/:coupon_type', to: 'coupons#new', as: 'new_coupon_type'
  
  resources :events do
    resources :orders

    get '/coupons/:coupon_id/line_item/:line_item_id/orders/new', to: 'events#create_order', as: 'event_coupon_order'
  end

  resources :orders do
    resources :payments, :only => [:new, :show, :create, :destroy] do
      collection do
        get :success
        get :cancel
        post :notify
      end
    end
  end

  resources :coupons do
    collection do
      get :select
      patch :update
    end
  end

  resources :line_items

end
