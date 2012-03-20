class State < ActiveRecord::Base
  belongs_to :user
  def self.per_page()
    10
  end
end
