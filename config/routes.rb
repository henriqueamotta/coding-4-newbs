Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "pages#home"

  # Rotas para Articles
  resources :articles do
    resources :forums,  only: [:new, :create,]
  end

  resources :forums, only: [:show, :index, :destroy] do
    resources :messages, only: [:create]
  end

  resources :messages, only: [:destroy]


  #get "up" => "rails/health#show", as: :rails_health_check

  # Rotas para Terms
  resources :terms

  # Rotas para Questions
  resources :questions, only: [:index, :create]

  # Rota para Search
  get 'search', to: 'search#index', as: :search

end
