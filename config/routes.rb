# frozen_string_literal: true

Rails.application.routes.draw do
  # Static Routes
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/history', to: 'static_pages#history'
  get '/executives', to: 'static_pages#executives'
  get '/membership', to: 'static_pages#membership'
  get '/sponsors', to: 'static_pages#sponsors'

  # User Sign Up and Sign In and Sign Out
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Contact Routes
  resources :contact, only: %i[index new create]

  # User Routes
  resources :users, path: '/players'
end
