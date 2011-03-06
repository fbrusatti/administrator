module Administrator
  class ApplicationController < ::ApplicationController
    before_filter :authenticate_admin

    helper_method :current_user

    private

      def authenticate_admin
        unless current_user
          flash[:error] = "Sorry, only authenticate admins users have access to that."
          redirect_to admin_log_in_url and return false
        end
      end

      def current_user
        @current_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
      end
  end
end

