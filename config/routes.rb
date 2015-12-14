Rails.application.routes.draw do

#Shoppe admin interface
  mount Shoppe::Engine => "/shoppe"

# Show Products
get "product/:permalink", to: "products#show", as: "product"
# post to cart
post "product/:permalink", to: "products#buy", as: "buy"

# Get Home
get "/home", to: "products#home", as: "home"
# Index Page
get "/index", to: "products#index", as: "index"
# Static Info Page
get "/info", to: "products#info", as: "info"
# Show cart
get "basket", to: "orders#show"
# clear basket
delete "basket", to: "orders#destroy"

# Checkout Routes
match "checkout", to: "orders#checkout", as: "checkout", via: [:get, :patch]
match "checkout/pay", to: "orders#payment", as: "checkout_payment", via: [:get, :post]
match "checkout/confirm", to: "orders#confirmation", as: "checkout_confirmation", via: [:get, :post]
# Home Page
root to: "products#home"
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
