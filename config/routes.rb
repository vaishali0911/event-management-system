Rails.application.routes.draw do
  resources :registrations
  resources :events
  resources :users

  post 'get-user-details', to: 'users#getUserDetails'
  get 'get-event-details', to: 'events#getEventDetails'
  get 'get-registered-user', to: 'registrations#getRegisteredUsers'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
