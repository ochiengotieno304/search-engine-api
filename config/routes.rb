# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :logs
  resources :articles
  post '/search', to: 'articles#search'
  get '/analytics/overall', to: 'analytics#overall'
  get '/analytics/per_user/:id', to: 'analytics#per_user'
end
