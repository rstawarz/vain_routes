module VainRoutes
   class RoutesController < ApplicationController
	layout 'vain_routes/base'
    unloadable

    def index
      @routes = Rails.application.routes.routes
    end
	
	def filter_routes(routes)
		routes.reject! { |r| r.path.to_s =~ %r{/rails/info/properties} } # Skip the route if it's internal info route
	end
	
	# def view_html_routes
	   # system("#{platform_specific_open_command} #{@out_file}")
	# end
  
	# def generate_html_routes!(routes)
	  # routes = filter_routes(routes)
	  
	  # template = File.open(File.join(@view_path, 'routes.html.erb'), "r"){|f| f.read }
	  # rendered_routes = ERB.new(template).result(binding)
	  
	  # File.open(@out_file, 'w') {|f| f.write(rendered_routes) }
   # end
   
  end
end