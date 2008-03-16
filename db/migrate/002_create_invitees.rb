class CreateInvitees < ActiveRecord::Migration
  def self.up
    create_table :invitees do |t|
      t.column :name, :string
      t.column :party_size, :integer
      t.column :response, :string
      t.column :room_id, :integer
      t.column :email, :string
      t.column :address, :string
      
      t.timestamps
    end
  end

  def self.down
    drop_table :invitees
  end
end
