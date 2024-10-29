Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA files
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # About Page
  get "/about", to: "pages#about", as: "about"

  # Set the root path of the application
  root "breeds#index"  # This will point to the breeds index as the home page

  # Users routes
  resources :users, only: [ :index ]

  # Breeds routes with `index` and `show`
  resources :breeds, only: [ :index, :show ]  # Add `show` to enable breed detail pages
end
