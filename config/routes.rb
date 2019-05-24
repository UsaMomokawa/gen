# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: "works#index"
  resources :users
  resources :works

  resources :works, only: %i(show) do
    resources :stages, only: %i(new create show), controller: "works/stages"
  end
end
