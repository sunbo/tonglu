class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.string :user_name
      t.string :title
      t.text :content
      t.string :mailcode
      t.string :smstype, :default => '0'
      t.boolean :isdeleted, :default => false
      t.datetime :receive_at
      t.string :flag
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
