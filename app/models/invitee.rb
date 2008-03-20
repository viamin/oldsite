# == Schema Information
# Schema version: 3
#
# Table name: invitees
#
#  id           :integer         not null, primary key
#  name         :string(255)     
#  party_size   :integer         
#  response     :string(255)     
#  room_id      :integer         
#  email        :string(255)     
#  address      :string(255)     
#  created_at   :datetime        
#  updated_at   :datetime        
#  under_four   :integer         
#  under_twelve :integer         
#

class Invitee < ActiveRecord::Base
  
  RESPONSES = ["I don't know yet", 'Attending', 'Not Attending']
end
