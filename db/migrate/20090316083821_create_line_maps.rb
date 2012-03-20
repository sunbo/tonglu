class CreateLineMaps < ActiveRecord::Migration
  def self.up
    create_table :line_maps do |t|
      t.integer :line_place_id
      t.datetime :date
      t.string :title
      t.string :address, :limit => 100
      t.decimal :lat, :precision => 15, :scale =>10
      t.decimal :lng, :precision => 15, :scale =>10
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :line_maps
  end
end
