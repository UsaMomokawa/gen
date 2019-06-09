# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  root to: "works#index"

  namespace "api" do
    resources :works, only: %i(show) do
      resources :stages, only: %i(show) do
        resource :progress, only: %i(show update), controller: "works/stages/progresses"
      end
    end
    resources :pages, only: %i(show update)
  end

  resources :users
  resources :works
  resources :pages, only: %i(create destroy)

  resources :works, only: %i(show) do
    resources :stages, only: %i(new create show), controller: "works/stages"
  end
end
