Rails.application.routes.draw do

  resources :reviews do
    resources :comments
  end

  # this allows us to use all of the methods "show/index/new/create" etc. run: $ rails routes
  resources :users

  resources :sessions

  root "reviews#index"



end
