Rails.application.routes.draw do
  devise_for :users do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end

  get '/users/:id' => "users#show"

  root to: "home#index"
end
