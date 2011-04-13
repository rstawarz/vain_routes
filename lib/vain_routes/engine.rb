#require "vain_routes"
#require "rails"

module VainRoutes
	class Engine < Rails::Engine
		initializer "static assets" do |app|
		  app.middleware.use ::ActionDispatch::Static, "#{root}/public"
		  #app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
		end
	end
end