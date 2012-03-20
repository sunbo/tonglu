class LineArticle < ActiveRecord::Base
  belongs_to :line_detail
  belongs_to :line_place
  belongs_to :user


  validates_presence_of     :title,  :message => "标题不能为空"
end
