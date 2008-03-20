class MainController < ApplicationController
  
  def index
    render :layout => false
  end
  
  def rsvp
    @invitee = Invitee.new
  end
  
end
