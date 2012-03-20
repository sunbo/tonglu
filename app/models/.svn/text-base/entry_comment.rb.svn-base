class EntryComment < ActiveRecord::Base
  belongs_to :entry, :counter_cache => true
  belongs_to :user

  validates_presence_of     :body,  :message => "评论内容不能为空"
  validates_length_of       :body, :maximum => 1000,   :message  => "评论内容最多255个字符"
end
