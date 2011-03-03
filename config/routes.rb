Rails.application.routes.draw do

#  get "log_out" => "sessions#destroy", :as => "log_out"
#  get "log_in" => "sessions#new", :as => "log_in"
#  get "sign_up", :to => "administrator/administrators#new", :as => "sign_up"
#  root :to => "users#new"

  get "admin" => "administrator/sessions#new", :as => "admin"
  get "sign_up" => "administrator/admins#new", :as => "sign_up"

  namespace :administrator do 
    resources :admins
#    resources :sessions
  end
end

