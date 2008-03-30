# == Schema Information
# Schema version: 7
#
# Table name: rooms
#
#  id           :integer         not null, primary key
#  name         :string(255)     
#  singles      :integer         
#  fulls        :integer         
#  queens       :integer         
#  capacity     :integer         
#  created_at   :datetime        
#  updated_at   :datetime        
#  nightly_rate :string(255)     
#  description  :string(255)     
#  booked       :integer         default(0)
#

class Room < ActiveRecord::Base
  
  def beds_string
    beds = String.new
    beds = beds + self.singles.to_s + " single bed" if (self.singles > 0)
    beds = beds + "s" if (self.singles > 1)
    beds = beds + ", " if ((self.fulls + self.queens) > 0)
    beds = beds + self.fulls.to_s + " full size bed" if (self.fulls > 0)
    beds = beds + "s" if (self.fulls > 1)
    beds = beds + ", " if (self.queens > 0)
    beds = beds + self.queens.to_s + " queen size bed" if (self.queens > 0)
    beds = beds + "s" if (self.queens > 1)
    beds
  end
  
  def nightly_cost
    rate = self.nightly_rate
    rate =~ /^\$(\d+)/
    cost = Regexp.last_match[1].to_i
    cost = cost + 8
    cost
  end
  
end
