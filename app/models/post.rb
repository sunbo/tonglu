class Post < ActiveRecord::Base
  belongs_to :topic, :counter_cache =>true
  belongs_to :user, :counter_cache =>true

  validates_presence_of     :body,  :message => "内容不能为空"
  validates_length_of       :body, :maximum => 10000,   :message  => "内容最多10000个字符"

   def self.per_page()
    5
   end
end
