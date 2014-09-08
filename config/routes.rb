Rails.application.routes.draw do
  resources :comments

  resources :tasks

  devise_for :users
  get '/english',  to: 'application#set_to_english'
  get '/russian',  to: 'application#set_to_russian'

  root 'tasks#index'

end
