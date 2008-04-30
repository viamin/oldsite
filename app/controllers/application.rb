# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'd57cca6de4db3572de62c39a2020970d'
  
  def authorize
    if params[:id] != 'argafarb' && (params[:controller] != 'invitees' || params[:controller] != 'rooms')
      if (session[:user_id].nil? || session[:user_id] == "")
        redirect_to :controller => 'main'
        return
      end
    end
  end
  
end
