class Forum < ActiveRecord::Base
  has_many :topics, :dependent => :delete_all
  has_many :posts, :through => :topics

  validates_presence_of     :name,  :message => "讨论区不能为空"
  validates_length_of       :name, :maximum => 255,   :message  => "讨论区标题最多255个字符"
  validates_length_of       :description, :maximum => 1000,   :message  => "讨论区描述最多1000个字符"
end
