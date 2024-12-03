Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :articles
=======


  get "up" => "rails/health#show", as: :rails_health_check

  # Rotas para Terms
  resources :terms


end
