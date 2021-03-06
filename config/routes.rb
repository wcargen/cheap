Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :items

  root 'static_pages#home'

  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  get "/info" => "items#info"
end
