Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Rotas para Articles
  resources :articles do
    resources :forums,  only: [:new, :create]
  end
  
  resources :forums, only: [:show] do
    resources :messages, only: [:create]
  end


  #get "up" => "rails/health#show", as: :rails_health_check

  # Rotas para Terms
  resources :terms


end
