Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources :accesses, only: [:new, :create]
  resources :profiles, only: [:new, :create]
  resources :rooms, only: :show
  resources :rooms, only: [:new, :create] do
    resources :chapters, only: [:new, :create]
  end
  resources :subjects, only: [:new, :create]
end


