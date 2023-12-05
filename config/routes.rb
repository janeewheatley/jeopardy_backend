Rails.application.routes.draw do
  root to: 'general#index'

  get 'welcome', to: 'welcome#index'
  #root to: 'welcome#index'

  resources :users

  get 'sign_up', to: 'registration#new'
  post 'sign_up', to: 'registration#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
