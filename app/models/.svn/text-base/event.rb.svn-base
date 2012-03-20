class Event < ActiveRecord::Base
  belongs_to :user
  validates_presence_of     :title,  :message => "标题不能为空"
  validates_presence_of     :description,  :message => "内容不能为空"
end
