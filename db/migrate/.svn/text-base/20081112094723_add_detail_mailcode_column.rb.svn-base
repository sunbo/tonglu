class AddDetailMailcodeColumn < ActiveRecord::Migration
  def self.up
    add_column :details, :mailcode, :string
    remove_column :messages,:mailcode
  end

  def self.down
    remove_column :details, :mailcode
    add_column :messages, :mailcode, :string
  end
end
