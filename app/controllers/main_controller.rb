class MainController < ApplicationController
  
  def index
    render :layout => false
  end
  
  def rsvp
    @invitee = Invitee.new
    render :layout => false
  end
  
  def respond
    @invitee = Invitee.new(params[:invitee])
    if @invitee.save
      redirect_to :action => 'thanks'
    else
      render :action => 'rsvp'
    end
  end
  
end
