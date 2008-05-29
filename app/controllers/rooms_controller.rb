class RoomsController < ApplicationController
  layout 'main'
  before_filter :authorize, :except => ['index', 'show', 'book', 'paid']
  
  # GET /rooms
  # GET /rooms.xml
  def index
    @rooms = Room.find(:all, :conditions => {:booked => 0})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rooms }
    end
  end

  # GET /rooms/1
  # GET /rooms/1.xml
  def show
    if params[:id] == "admin"
      admin
      render :action => 'admin'
    else
      @room = Room.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @room }
      end
    end
  end

  # GET /rooms/new
  # GET /rooms/new.xml
  def new
    @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @room }
    end
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.xml
  def create
    @room = Room.new(params[:room])

    respond_to do |format|
      if @room.save
        flash[:notice] = 'Room was successfully created.'
        format.html { redirect_to(@room) }
        format.xml  { render :xml => @room, :status => :created, :location => @room }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.xml
  def update
    @room = Room.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        flash[:notice] = 'Room was successfully updated.'
        format.html { redirect_to(@room) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.xml
  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to(rooms_url) }
      format.xml  { head :ok }
    end
  end
  
  def book
    @room = Room.find(params[:id])
    unless session[:invitee_id].nil?
      @invitee = Invitee.find(session[:invitee_id]) 
      if @invitee.response != "Yes"
        flash[:notice] = "You can't book a room if you're not coming."
        redirect_to :controller => 'main', :action => 'change'
      end
    else
      flash[:notice] = "You need to RSVP before you can book a room. If you've already RSVP'd, scroll down to the bottom and click the link to update your RSVP, which will log you back into the system so you can book a room."
      redirect_to :controller => 'main', :action => 'rsvp'
    end
  end
  
  def paid
    @room = Room.find(params[:id])
    if (@room.name != "Tent" && @room.name != "Rent-a-tent")
      @room.booked = @room.booked + 1
      @room.save!
    end
  end
  
  def admin
    @rooms = Room.find(:all)

    respond_to do |format|
      format.html # admin.html.erb
      format.xml  { render :xml => @rooms }
    end
  end
  
end
