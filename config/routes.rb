# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "works#index"
  resources :works
end
