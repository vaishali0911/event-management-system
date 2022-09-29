Rails.application.routes.draw do
  resources :registrations
  resources :events
  resources :users
  # match '/:email', to: 'users#show' , via: 'get'
  # get 'api/users', to: 'application#users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
