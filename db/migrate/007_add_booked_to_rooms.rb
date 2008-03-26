class AddBookedToRooms < ActiveRecord::Migration
  def self.up
    add_column :rooms, :booked, :integer, :default => 0
  end

  def self.down
    remove_column :rooms, :booked
  end
end
