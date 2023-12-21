Rails.application.routes.draw do
  devise_for :users
  root to: 'general#index'

  resources :clues

  resources :users

end
