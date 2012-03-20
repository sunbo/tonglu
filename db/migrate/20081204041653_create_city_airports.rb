class CreateCityAirports < ActiveRecord::Migration
  def self.up
    create_table :city_airports do |t|
      t.string :city_name
      t.string :airport_name
      t.timestamps
    end
  end

  def self.down
    drop_table :cities
  end
end
