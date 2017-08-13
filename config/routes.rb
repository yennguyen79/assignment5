Rails.application.routes.draw do
   get 'friendships/new'

   get 'sessions/new'
   post 'friendship/create' =>"friendships#create"
   post 'friendship/destroy' => "friendships#destroy"
   delete "remove_friend" => "friendships#destroy"

  root "home#index"
  
  get 'login' => "sessions#new"
  post "login" => "sessions#create"
  get '/logout' => "sessions#destroy"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  
end
