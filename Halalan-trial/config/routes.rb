Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users

  resources :users

  get "/profile", to: "users/users#index" 
  get "/voting/new/:id", to: "voting/votes#new"

  get "/about" => "pages#about", as: :about
  get "/about/evilla", to: "about#evilla" 
  get "/about/gomez", to: "about#gomez" 
  get "/about/guian", to: "about#guian" 
  get "/about/principe", to: "about#principe" 
  

  namespace :voting do
    resources :votes
  end
  

  namespace :admin do
    resources :candidates
    resources :positions
  end
end
