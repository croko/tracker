Rails.application.routes.draw do

  resources :tasks do
    resources :comments, only: [:index, :new, :create]
  end

  devise_for :users

  get '/english',  to: 'application#set_to_english'
  get '/russian',  to: 'application#set_to_russian'

  root 'tasks#index'

end
