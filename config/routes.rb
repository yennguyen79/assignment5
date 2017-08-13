Rails.application.routes.draw do
 
  
   get 'sessions/new'
   post 'friendship/create' =>"friendships#create"
   pots 'friendship/destroy' => "friendships#destroy"

  root "home#index"
  
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get '/logout' => "sessions#destroy"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
