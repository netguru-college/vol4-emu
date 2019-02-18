Rails.application.routes.draw do
  resources :events
  resources :categories

  root 'events#index'
  devise_for :users
end
