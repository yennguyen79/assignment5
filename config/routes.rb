Rails.application.routes.draw do
  get 'users/new'
  root "users#new"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
