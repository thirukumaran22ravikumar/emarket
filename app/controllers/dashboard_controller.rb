class DashboardController < ApplicationController
  	before_filter :authenticate_user!
  	def index
  		p "hi"
  		p current_user.inspect
    	path = case current_user.role
      
	      when 'admin'
	       	e_markets_path 
	      else 
	        userwebs_path
   	    end
    	redirect_to path
	end

end



