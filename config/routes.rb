Rails.application.routes.draw do

  root to: 'welcome#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :rides, only: [:create]
  resources :attractions
  get 'signin', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
end
