Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources :accesses, only: [:new, :create]
  resources :chapters, only: [:new, :create]
  resources :profiles, only: [:new, :create]
  resources :rooms, only: [:show, :new, :create]
  resources :subjects, only: [:new, :create]
end
