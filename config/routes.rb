# frozen_string_literal: true

Rails.application.routes.draw do
  # Static Routes
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/history', to: 'static_pages#history'
  get '/executives', to: 'static_pages#executives'
  get '/membership', to: 'static_pages#membership'
  get '/sponsors', to: 'static_pages#sponsors'

  # Contact Routes
  resources :contact, only: %i[index new create]
end
