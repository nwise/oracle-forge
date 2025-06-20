Rails.application.routes.draw do
  resources :moves, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]

  get "up" => "rails/health#show", as: :rails_health_check
  root "main#index"
end
