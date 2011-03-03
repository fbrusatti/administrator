require "rails"

module Administrator
  class Engine < Rails::Engine
#    engine_name "administrator"

    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
