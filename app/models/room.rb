# == Schema Information
# Schema version: 3
#
# Table name: rooms
#
#  id         :integer         not null, primary key
#  name       :string(255)     
#  singles    :integer         
#  twins      :integer         
#  queens     :integer         
#  capacity   :integer         
#  created_at :datetime        
#  updated_at :datetime        
#

class Room < ActiveRecord::Base
end
