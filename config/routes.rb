Rails.application.routes.draw do
  resources :events

  root 'events#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'events/:id/RSVP', to: 'events#join', as: 'join_event'
  delete 'events/:id/RSVP', to: 'events#leave', as: 'leave_event'
end
