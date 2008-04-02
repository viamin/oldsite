class InfoController < ApplicationController
  layout 'main'
  
  def index
    
  end
  
  def directions
    
  end
  
  def lodging
  end
  
  def registry
    render :action => 'directions'
  end
  
  def bring
    render :action => 'directions'
  end
  
end
