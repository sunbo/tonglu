require 'active_record/fixtures'
class AddCityAirportData < ActiveRecord::Migration
  def self.up
    down
   city_airport = File.dirname(__FILE__) + "/city_data/"
   Fixtures.create_fixtures(city_airport, "city_airports")
  end

  def self.down
   CityAirport.delete_all
  end
end
