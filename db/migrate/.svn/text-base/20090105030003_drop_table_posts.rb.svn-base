class DropTablePosts < ActiveRecord::Migration
  def self.up
    drop_table :posts
  end

  def self.down
    create_table :posts do |t|
      t.integer :user_id
      t.string :headline
      t.text :body
      t.timestamps
    end
  end
end
