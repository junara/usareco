# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: %i(new create destroy)
  resources :home, only: %i(index)
  resources :users, only: %i(show)
  resources :rabbits do
    resource :feeding do
    end
  end

  namespace :api do
    resources :rabbits, param: :token do
      member do
        post 'slack'
      end
    end
  end
end
