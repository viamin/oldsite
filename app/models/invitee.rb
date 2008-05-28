# == Schema Information
# Schema version: 10
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
#  housing      :string(255)     
#  notes        :text            
#

class Invitee < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :response
  validates_format_of :email, :with => /^((.+)@((?:[-a-z0-9]+\.)+[a-z]{2,})|none)$/i
  def validate
    if response == "Yes" && ((under_four + under_twelve + 1) > party_size)
      errors.add(:party_size, "must be bigger than the number of children + one adult")
    end
  end
  validates_uniqueness_of :email, :message => "has already been used", :unless => Proc.new { |invitee| invitee.email.downcase == "none"}
  
  RESPONSES = ['Yes', 'No']
  HOUSING = ["I Don't Know", "Camp on site in a tent", "Stay in a cabin on site", "Stay in a house on site", "Hotel near Santa Cruz", "Hotel near Watsonville", "Other"]
end
