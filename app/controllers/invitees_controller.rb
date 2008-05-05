class InviteesController < ApplicationController
  layout 'main'
  before_filter :authorize
  
  # GET /invitees
  # GET /invitees.xml
  def index
    @invitees = Invitee.find(:all)
    totals = @invitees.collect {|i| i.response == "Yes" ? i.party_size : 0 }
    @total = 0
    totals.each {|t| @total = @total + t}
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invitees }
    end
  end
  
  def argafarb
    session[:user_id] = "blaganth"
    redirect_to :action => 'index'
  end

  # GET /invitees/1
  # GET /invitees/1.xml
  def show
    if params[:id] == 'argafarb'
      redirect_to :action => 'index'
    else
      @invitee = Invitee.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @invitee }
      end
    end
  end

  # GET /invitees/new
  # GET /invitees/new.xml
  def new
    @invitee = Invitee.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invitee }
    end
  end

  # GET /invitees/1/edit
  def edit
    @invitee = Invitee.find(params[:id])
  end

  # POST /invitees
  # POST /invitees.xml
  def create
    @invitee = Invitee.create(params[:invitee])

    respond_to do |format|
      if @invitee.save
        flash[:notice] = 'Invitee was successfully created.'
        format.html { redirect_to(@invitee) }
        format.xml  { render :xml => @invitee, :status => :created, :location => @invitee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invitee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invitees/1
  # PUT /invitees/1.xml
  def update
    @invitee = Invitee.find(params[:id])

    respond_to do |format|
      if @invitee.update_attributes(params[:invitee])
        flash[:notice] = 'Invitee was successfully updated.'
        format.html { redirect_to(@invitee) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invitee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invitees/1
  # DELETE /invitees/1.xml
  def destroy
    @invitee = Invitee.find(params[:id])
    @invitee.destroy

    respond_to do |format|
      format.html { redirect_to(invitees_url) }
      format.xml  { head :ok }
    end
  end
end
