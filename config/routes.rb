Rails.application.routes.draw do
  # Root path
  root 'pages#home'

  # Additional pages
  get 'about', to: 'pages#about'
  get 'projects', to: 'pages#projects'
  get 'contact', to: 'pages#contact'

  # Existing health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Existing PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end