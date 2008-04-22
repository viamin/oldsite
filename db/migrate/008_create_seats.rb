class CreateSeats < ActiveRecord::Migration
  def self.up
    create_table :seats do |t|
      t.column :time, :datetime
      t.column :destination, :string
      t.column :number, :integer
      t.column :invitee_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :seats
  end
end
