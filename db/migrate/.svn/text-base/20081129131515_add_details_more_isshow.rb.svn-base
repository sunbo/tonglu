class AddDetailsMoreIsshow < ActiveRecord::Migration
  def self.up
    add_column :details, :is_show_details, :string, :default => "friend"
    add_column :details, :is_show_ims, :string, :default => "friend"
    add_column :details, :is_show_works, :string, :default => "friend"
  end

  def self.down
    remove_column :details, :is_show_details
    remove_column :details, :is_show_ims
    remove_column :details, :is_show_works
  end
end
