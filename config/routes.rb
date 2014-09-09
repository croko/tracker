Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    resources :tasks, only: [:index, :show]
    get '*unmatched_route', to: 'base#raise_not_found'
  end

  resources :tasks do
    resources :comments, only: [:index, :new, :create]
  end

  devise_for :users

  get '/english', to: 'application#set_to_english'
  get '/russian', to: 'application#set_to_russian'

  root 'tasks#index'

end
