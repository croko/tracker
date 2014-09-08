Rails.application.routes.draw do
  resources :comments

  resources :tasks

  devise_for :users

  root 'tasks#index'

end
