class InfoController < ApplicationController
  layout 'main'
  
  def index
    
  end
  
  def directions
    
  end
  
  def lodging
    render :action => 'directions'
  end
  
  def registry
    render :action => 'directions'
  end
  
  
end
