Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  resources :reviews do
    resources :comments
    resource :bookmark
  end

  # this allows us to use all of the methods "show/index/new/create" etc. run: $ rails routes
  resources :users

  # Use singular as there can only be one session per user. One log in, one log out.
  resource :session

  get "about", to: "pages#about"

  root "reviews#index"



end
