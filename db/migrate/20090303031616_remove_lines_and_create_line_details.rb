class RemoveLinesAndCreateLineDetails < ActiveRecord::Migration
  def self.up
    drop_table :lines

    create_table :line_details do |t|
      t.integer :user_id
      t.string :title
      t.string :endcity
      t.text :body
      t.datetime :startdate
      t.datetime :enddate
      t.boolean :is_private, :default => false
      t.string :prcture
      t.string :startcity
      t.datetime :airtime
      t.string :number
      t.string :airlinesname
      t.string :status
      t.timestamps
    end

  end

  def self.down
    create_table :lines do |t|
      t.integer :user_id
      t.string :title
      t.string :endcity
      t.text :body
      t.datetime :startdate
      t.datetime :enddate
      t.boolean :is_private, :default => false
      t.string :prcture
      t.string :startcity
      t.datetime :airtime
      t.string :number
      t.string :airlinesname
      t.string :status
      t.timestamps
    end

    drop_table :line_details
  end
end
