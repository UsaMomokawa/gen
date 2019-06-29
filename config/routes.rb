# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "works#index"

  get "/welcome", to: "welcome#index", as: "welcome"
  get "/discramer", to: "discramer#index", as: "discramer"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

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
    resources :stages, only: %i(index new create show edit update destroy), controller: "works/stages"
  end
end
