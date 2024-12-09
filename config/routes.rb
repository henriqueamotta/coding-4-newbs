Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Rotas para Articles
  resources :articles


  #get "up" => "rails/health#show", as: :rails_health_check

  # Rotas para Terms
  resources :terms

  # Rotas para Questions
  resources :questions, only: [:index, :create]


end
