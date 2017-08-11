Rails.application.routes.draw do
 

  get 'users/new'
  root "home#index"
  
  get '/logout' => "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
