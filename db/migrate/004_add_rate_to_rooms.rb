class AddRateToRooms < ActiveRecord::Migration
  def self.up
    add_column :rooms, :nightly_rate, :string
  end

  def self.down
    remove_column :rooms, :nightly_rate
  end
end
