Rails.application.routes.draw do
  # Root path
  root "home#index"

  get "flow", to: "pages#flow"
  get "engineer", to: "pages#engineer"
  get "become", to: "pages#become"
  get "be", to: "pages#be"

  # Existing health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Existing PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Tools and Setups routes
  get "tools-and-setups", to: "pages#tools_and_setups"
  get "tools-and-setups/dashboard", to: "pages#dashboard"
  get "tools-and-setups/self-sufficiency", to: "pages#self_sufficiency"
  get "tools-and-setups/personal-tech-stack", to: "pages#personal_tech_stack"
  get "tools-and-setups/saas-apps-stack", to: "pages#saas_apps_stack"
  get "tools-and-setups/enterprise-engineering-stack", to: "pages#enterprise_engineering_stack"
  get "tools-and-setups/habit-stack", to: "pages#habit_stack"
  get "tools-and-setups/book-stack", to: "pages#book_stack"
  get "tools-and-setups/hub-stack", to: "pages#hub_stack"
  get "tools-and-setups/skill-stack", to: "pages#skill_stack"
  get "tools-and-setups/perspective-stack", to: "pages#perspective_stack"
  get "tools-and-setups/consumption-stack", to: "pages#consumption_stack"
  get "tools-and-setups/growth-stack", to: "pages#growth_stack"
  get "tools-and-setups/future-stack", to: "pages#future_stack"

  # Add this line in the public documentation section
  get "theory-of-everything", to: "pages#theory_of_everything"
end
