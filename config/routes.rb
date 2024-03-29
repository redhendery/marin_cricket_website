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
  get '/logout', to: 'sessions#destroy'

  # Team specific routes
  resources :teams

  # Newsletter routes
  resources :newsletters, only: %i[new create]
  get 'newsletters/remove'
  delete 'newsletters', to: 'newsletters#destroy'

  # Contact Page Routes
  resources :contact, only: %i[index new create]

  # Account Activation and Password Reset Routes
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]

  # User Routes, with path as /players
  resources :users, path: '/players' do
    member do
      get :make_admin, :remove_admin, :paid, :not_paid,
                  :activate_account, :deactivate_account
    end
  end

  # Event routes, signup / withdrawal links
  resources :events do
    member do
      get :event_signup, :event_withdrawal
    end
  end
  
  # Schedule routes for individual teams, game signup / withdrawl and selections
  resources :schedules do
    collection do
      get :bears, :league, :socials
    end
    member do
      get :game_signup, :game_withdrawal, :selection
    end
  end

end
