Administrator::Engine.routes.draw do
  #  get 'admin'         => 'administrator/admin#index',       :as => 'admin'
  root :to => 'administrator/admin#index'

  get "admin_signup"  => "administrator/admins#new",        :as => "sign_up"
  get "admin_login"   => "administrator/sessions#new",      :as => "log_in"
  get "admin_logout"  => "administrator/sessions#destroy",  :as => "log_out"


  namespace :administrator do 
    resources :admins
    resources :sessions
  end
end

