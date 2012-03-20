class CreateEntryComments < ActiveRecord::Migration
  def self.up
    create_table :entry_comments do |t|
      t.integer :entry_id
      t.integer :user_id
      t.string :guest_name
      t.string :guest_email
      t.string :guest_url
      t.text :body
      t.timestamps
    end

    add_index :entry_comments, :entry_id
  end

  def self.down
    drop_table :entry_comments
  end
end
