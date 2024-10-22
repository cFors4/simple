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

  # stacks
  get "personal-tech-stack", to: "pages#personal_tech_stack"
  get "saas-apps-stack", to: "pages#saas_apps_stack"
  get "enterprise-engineering-stack", to: "pages#enterprise_engineering_stack"
  get "book-stack", to: "pages#book_stack"
  get "hub-stack", to: "pages#hub_stack"
  get "consumption-stack", to: "pages#consumption_stack"
  get "growth-stack", to: "pages#growth_stack"
  get "future-stack", to: "pages#future_stack"
  get "therapy-and-measurement-stack", to: "pages#therapy_and_measurement_stack"
  get "system-theory-stack", to: "pages#system_theory_stack"
  get "become-theory-table", to: "pages#become_theory_table"


  # Add this line in the public documentation section
  get "theory-of-everything", to: "pages#theory_of_everything"
  get "toe", to: "pages#theory_of_everything"

  get "dashboard", to: "pages#dashboard"
  get "dash", to: "pages#dashboard"

  get "homo-memetic-techno-capital", to: "pages#homo_memetic_techno_capital"
  get "skillful", to: "pages#skillful"
  get "purpose-programming", to: "pages#purpose_programming"
  get "individual-configurability", to: "pages#individual_configurability"

  # Add this line in the public documentation section
  get "conscious-living", to: "pages#conscious_living"
end
