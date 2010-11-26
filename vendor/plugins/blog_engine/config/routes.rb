Rails.application.routes.draw do

  root :to => "posts#index"

  resources :posts
  resources :comments

  resources :users

  match "sign_up" => "users#new", :as => :sign_up

end
