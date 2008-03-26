class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.column :name, :string
      t.column :singles, :integer, :default => 0
      t.column :twins, :integer, :default => 0
      t.column :queens, :integer, :default => 0
      t.column :capacity, :integer, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
