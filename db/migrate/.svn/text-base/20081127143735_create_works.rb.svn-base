class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.integer :user_id
      t.string :name
      t.string :position
      t.text :description
      t.string :startyear
      t.string :endyear
      t.float  :workspan
      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end
