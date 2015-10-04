Rails.application.routes.draw do
  devise_for :users 

  get '/users/:id' => "users#show"
  get '/images' => "images#index"
  post '/images/new' => "images#create"
  post '/images/:id/update' => "images#update"
  get '/images/:id' => "images#show"

  root to: "home#index"
end
