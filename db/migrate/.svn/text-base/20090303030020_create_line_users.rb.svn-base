class CreateLineUsers < ActiveRecord::Migration
  def self.up
    create_table :line_users do |t|
      t.integer :line_id
      t.integer :user_id
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :line_users
  end
end
