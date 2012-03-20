class LineNote < ActiveRecord::Base
  belongs_to :line_detail
  belongs_to :line_place
  belongs_to :user


  validates_presence_of     :body,  :message => "内容不能为空"
end
