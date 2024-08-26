Rails.application.routes.draw do
  # Root path
  root 'home#index'

  # Routes for metrics, stacks, and models
  get 'metrics', to: 'metrics#index'
  get 'stacks', to: 'stacks#index'
  get 'models', to: 'models#index'

  get 'flow', to: 'pages#flow'
  get 'engineer', to: 'pages#engineer'
  get 'become', to: 'pages#become'
  get 'be', to: 'pages#be'


  # Existing health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Existing PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
