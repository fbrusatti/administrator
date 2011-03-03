Rails.application.routes.draw do

#  get "log_out" => "sessions#destroy", :as => "log_out"
#  root :to => "users#new"

  get 'admin' => 'administrator/admin#index', :as => 'admin'
  get "admin_login" => "administrator/sessions#new", :as => "log_in"
  get "admin_signup" => "administrator/admins#new", :as => "sign_up"

  namespace :administrator do 
    resources :admins
    resources :sessions
  end
end

