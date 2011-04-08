Rails.application.routes.draw do |map|
   #resources :accounts, :controller => 'vain_routes/routes', :only => [:show]
   match "vain/routes" => "vain_routes/routes#show"
 end