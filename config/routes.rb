Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources :accesses, only: [:new, :create, :destroy]
  resources :chapters, only: :show do
    resources :missions, only: [:new, :create]
  end
  resources :flashcards, only: :destroy
  resources :profiles, only: [:new, :create]
  resources :missions, only: [:show, :destroy, :edit, :update] do
    resources :flashcards, only: [:create]
    member do
      get :play
    end
  end
  resources :rooms, only: [:new, :create, :destroy]
  resources :rooms, only: [:show] do
    resources :chapters, only: [:new, :create]
  end
  resources :subjects, only: [:new, :create]
end


