require 'rbconfig'
require 'erb' 

module VainRoutes
  
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load "vain_routes.rake"
      end
 
  end
  
  class  Narcissism
  
	attr_accessor :view_path, :out_file
	def initialize()
		@view_path = './'
		@out_file = './routes.html'
	end
	
	def filter_routes(routes)
		routes.reject! { |r| r.path.to_s =~ %r{/rails/info/properties} } # Skip the route if it's internal info route
	end
	
	def view_html_routes
	   system("#{platform_specific_open_command} #{@out_file}")
	end
  
	def generate_html_routes!(routes)
	  routes = filter_routes(routes)
	  
	  template = File.open(File.join(@view_path, 'routes.html.erb'), "r"){|f| f.read }
	  rendered_routes = ERB.new(template).result(binding)
	  
	  File.open(@out_file, 'w') {|f| f.write(rendered_routes) }
   end
     def platform_specific_open_command
        cmd = case Config::CONFIG['host_os']
		 when /mingw|mswin|windows/i
		   'start'
		 when /darwin|mac os/i
		   'open'
		 when /solaris|bsd|linux|aix|cygwin/i
		   rais NotImplementedException("Hey there, sorry, but I haven't gotten to implementing this on Linux yet")
		end
		
	 end
  end
end
