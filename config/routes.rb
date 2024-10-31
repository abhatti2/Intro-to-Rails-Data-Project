Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA files
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # About Page
  get "/about", to: "pages#about", as: "about"

  # Map view for user locations
  get "/users/map", to: "users#map", as: "users_map"

  # Set the root path of the application
  root "breeds#index"  # This will point to the breeds index as the home page

  # Users routes
  resources :users, only: [ :index, :show ]

  # Breeds routes with `index` and `show`
  resources :breeds, only: [ :index, :show ] do
    collection do
      get "alphabet/:letter", action: :alphabet, as: :alphabet  # Custom route for alphabetical filtering
    end
  end
end
