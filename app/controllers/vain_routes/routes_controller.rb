module VainRoutes
   class RoutesController < ApplicationController

    unloadable

    def show
      render :inline =>"Hello World!"
    end
  end
end