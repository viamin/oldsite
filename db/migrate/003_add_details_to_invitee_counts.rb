class AddDetailsToInviteeCounts < ActiveRecord::Migration
  def self.up
    add_column :invitees, :under_four, :integer
    add_column :invitees, :under_twelve, :integer
  end

  def self.down
    remove_column :invitees, :under_four
    remove_column :invitees, :under_twelve
  end
end
