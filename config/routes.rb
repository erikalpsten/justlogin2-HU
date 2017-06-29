Rails.application.routes.draw do
  # This line mounts Refinery's routes at the root of your application.
  # This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
  # If you would like to change where this extension is mounted, simply change the
  # configuration option `mounted_path` to something different in config/initializers/refinery/core.rb
  #
  # We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"

  post '/contact' => 'contact#create'
  %w(glossary contact complete).each do |page|
    get "/#{page}" => "home##{page}"
  end

  devise_scope :authentication_devise_user do
    get '/login', to:  'refinery/authentication/devise/sessions#new_hr_user', as: :login
    post '/login', to: 'refinery/authentication/devise/sessions#create'
    resources :users, :only => [:edit, :update], :controller => 'refinery/authentication/devise/users'
    # namespace :refinery, path: '' do
    #   namespace :authentication, path: '' do
    #     namespace :devise, path: '' do
    #       resources :users
    #     end
    #   end
    # end
  end



  post '/process/:action', controller: :processing
  get '/main' => 'home#main'
  root 'refinery/products/benefits#index'
  mount Refinery::Core::Engine, at: Refinery::Core.mounted_path

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
