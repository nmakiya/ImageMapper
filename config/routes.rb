Rails.application.routes.draw do
  devise_for :users

  get '/users/:id' => "users#show"

  root to: "home#index"
end
