# == Schema Information
# Schema version: 10
#
# Table name: seats
#
#  id          :integer         not null, primary key
#  time        :datetime        
#  destination :string(255)     
#  number      :integer         
#  invitee_id  :integer         
#  created_at  :datetime        
#  updated_at  :datetime        
#

class Seat < ActiveRecord::Base
end
