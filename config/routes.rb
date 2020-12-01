Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources :profiles, only: [:new, :create]
  resources :subjects, only: [:new, :create]
end
