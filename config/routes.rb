Rails.application.routes.draw do |map|

  # Prefix route urls with "admin" and route names with "rails_admin_"
  scope "admin", :module => :administrator, :as => "admin" do
    root :to => 'admin#index'

    get "admin_signup"  => "admins#new",        :as => "sign_up"
    get "admin_login"   => "sessions#new",      :as => "log_in"
    get "admin_logout"  => "sessions#destroy",  :as => "log_out"

    resources :admins
    resources :sessions
  end

end


#Administrator::Engine.routes.draw do
#end

