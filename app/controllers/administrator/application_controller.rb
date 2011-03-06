module Administrator
  class ApplicationController < ::ApplicationController
    helper_method :current_user

    private

      def current_user
        @current_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
      end
  end
end

