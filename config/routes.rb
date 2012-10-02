Inventario::Application.routes.draw do
  resources :p_details

  resources :locations

  root :to => "Activities#home"

  resources :users

  resources :expenses

  resources :activities

  resources :employees

  resources :customers

  resources :sales

  resources :details

  resources :stocks

  resources :purchases

  resources :products

  resources :product_types

  resource  :user_session, :only => [:new, :create, :destroy]

  delete "logout" => "user_sessions#destroy", :as => :logout

  match "sign_in" => "User_sessions#new", :as => "signin"

  put "liquidar" => "employees#liquidar", :as => :liquidar

  get "liquidados" => "employees#index_liquidados", :as => :liquidados

  get "nueva_venta" => "details#new", :as => :nueva_venta

  match "por_mes_expenses" => "expenses#por_mes", :as => :por_mes_expenses

  put "close_purchase" => "p_details#close_purchase", :as => :close_purchase

  delete "delete_purchase" => "p_details#delete_purchase", :as => :delete_purchase
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
end
