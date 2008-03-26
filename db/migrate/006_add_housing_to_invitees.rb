class AddHousingToInvitees < ActiveRecord::Migration
  def self.up
    add_column :invitees, :housing, :string
  end

  def self.down
    remove_column :invitees, :housing
  end
end
