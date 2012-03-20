class CreateLines < ActiveRecord::Migration
  def self.up
    create_table :lines do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.datetime :startdate
      t.datetime :enddate
      t.string :startcity
      t.string :endcity
      t.string :number
      t.string :status
      t.string :airlinesname
      t.timestamps
    end
  end

  def self.down
    drop_table :lines
  end
end
