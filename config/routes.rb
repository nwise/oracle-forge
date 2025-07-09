Rails.application.routes.draw do
  resources :moves

  get "up" => "rails/health#show", as: :rails_health_check
  root "main#index"
end
