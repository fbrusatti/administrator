require "administrator"
require "rails"

module Administrator
  class Engine < ::Rails::Engine
    # The new version will need it...
    #    namespace Administrator
    #    isolate_namespace Administrator

    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end

