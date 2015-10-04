Rails.application.routes.draw do
  devise_for :users 

  get '/users/:id' => "users#show"
  get '/images' => "images#index"
  post '/images/new' => "images#create"
  get '/images/:id' => "images#show"

  root to: "home#index"
end
