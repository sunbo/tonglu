class Entry < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  has_many :entry_comments

  validates_presence_of     :title,  :message => "标题不能为空"
  validates_presence_of     :body,  :message => "内容不能为空"
  validates_length_of       :title, :maximum => 255,   :message  => "标题最多255个字符"
  validates_length_of       :title, :maximum => 10000,   :message  => "内容最多10000个字符"

   def self.per_page()
    5
   end
end
