class AddNotesToInvitees < ActiveRecord::Migration
  def self.up
    add_column :invitees, :notes, :text
  end

  def self.down
    remove_column :invitees, :notes
  end
end
