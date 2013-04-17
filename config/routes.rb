Rodzinka::Application.routes.draw do

  get 'profile/invitations', to: 'profiles#invitations' # TODO: ładniej?


  # resources :permissions_to_families


  resources :families do
    resources :family_albums, path: 'albums' do
      resources :family_photos, path: 'photos', except: [:index]
    end

    resources :invitations, only: [:index, :create, :update, :destroy]
  end


  controller :sessions do
    get 'login', to: :new
    post 'login', to: :create
    delete 'logout', to: :destroy
  end


  resources :users, only: [:show] do
    resources :user_albums, path: 'albums' do
      resources :user_photos, path: 'photos', except: [:index]
    end
  end


  controller :users do
    #get 'users/:id', to: :show
    get 'register', to: :new
    post 'register', to: :create

    #resources :albums
  end


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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
