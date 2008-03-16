class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.column :name, :string
      t.column :singles, :integer
      t.column :twins, :integer
      t.column :queens, :integer
      t.column :capacity, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
