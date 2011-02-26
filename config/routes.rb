Rails.application.routes.draw do

#  get "log_out" => "sessions#destroy", :as => "log_out"
#  get "log_in" => "sessions#new", :as => "log_in"
#  get "sign_up" => "users#new", :as => "sign_up"
#  root :to => "users#new"

  get "admin" => "administrator/sessions#new", :as => "admin"

  namespace :administrator do 
    resources :administrators
    resources :sessions
  end
end
