class CreateMailcodes < ActiveRecord::Migration
  def self.up
    remove_column :details, :mailcode
     create_table :mailcodes do |t|
      t.integer :user_id
      t.string :email
      t.string :mailcode
      t.timestamps
    end
  end

  def self.down
    add_column :details, :mailcode, :string
    drop_table :mailcodes
  end
end
