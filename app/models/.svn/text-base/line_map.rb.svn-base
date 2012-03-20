class LineMap < ActiveRecord::Base
  acts_as_mappable
  before_validation :geocode_address




  belongs_to :line_detail
  belongs_to :line_place
  belongs_to :user


  validates_presence_of     :title,  :message => "地图名称不能为空"
  validates_presence_of     :address,  :message => "目的地不能为空"

private
def geocode_address
  geo=GeoKit::Geocoders::MultiGeocoder.geocode(address)
  errors.add(:address, "Could not Geocode address") if !geo.success
  self.lat, self.lng = geo.lat,geo.lng if geo.success
end
end
