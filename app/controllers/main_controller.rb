class MainController < ApplicationController
  
  def index
    
  end
  
  def rsvp
    @invitee = Invitee.new
  end
  
  def respond
    @invitee = Invitee.new(params[:invitee])
    if @invitee.save
      session[:invitee_id] = @invitee.id
      redirect_to :action => 'thanks'
    else
      render :action => 'rsvp'
    end
  end
  
  def thanks
    @invitee = Invitee.find(session[:invitee_id])
    @invitee.response == "Yes" ? @message = "We're looking forward to seeing you on August 8th!" : @message = "We're sorry you can't make it."
  end
  
  def change
    
  end
  
  def update
    @invitees = Invitee.find(:all, :conditions => {:email => params[:email]})
    if @invitees.empty?
      @invitees = Invitee.find(:all, :conditions => {:name => params[:email]})
      if @invitees.empty?
        @message = "An RSVP with that email address was not found."
      end
    end
    @invitee = @invitees.first
    render :layout => false
  end
  
  def edit
    @invitee = Invitee.find(params[:id])
    @invitee.update_attributes(params[:invitee])
    redirect_to :action => 'thanks'
  end
  
end
