class AddDescriptionToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :description, :string
    rename_column :rooms, :twins, :fulls
  end

  def self.down
    remove_column :rooms, :description
    rename_column :rooms, :fulls, :twins
  end
end
