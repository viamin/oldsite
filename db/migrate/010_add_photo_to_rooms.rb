class AddPhotoToRooms < ActiveRecord::Migration
  def self.up
    add_column :rooms, :photo, :string
  end

  def self.down
    remove_column :rooms, :photo
  end
end
