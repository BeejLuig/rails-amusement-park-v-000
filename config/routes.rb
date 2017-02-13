Rails.application.routes.draw do

  root to: 'welcome#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :attractions
  get 'signin', to: 'sessions#new'
end
