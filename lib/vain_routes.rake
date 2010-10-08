desc 'Print out all defined routes in match order, with names. Target specific controller with CONTROLLER=x.'
task :vain_routes => :environment do
  Rails.application.reload_routes!
  all_routes = Rails.application.routes.routes

  narcissist = VainRoutes::Narcissism.new
  
  narcissist.generate_html_routes!(all_routes)
  
  narcissist.view_html_routes
  
end
