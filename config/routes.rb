Rails.application.routes.draw do
 
  
  get 'hoangyen/quy'

  root "home#index"
  get "buddies" => "hoangyen#quy"
  get "cities" => "playground#index"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get '/logout' => "sessions#destroy"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
