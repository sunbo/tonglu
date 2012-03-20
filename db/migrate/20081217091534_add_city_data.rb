require 'active_record/fixtures'
class AddCityData < ActiveRecord::Migration
 def self.up
   down
   city = File.dirname(__FILE__) + "/city_data/"
   Fixtures.create_fixtures(city, "cities")
 end

 def self.down
   City.delete_all
 end
end
