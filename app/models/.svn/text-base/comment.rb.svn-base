class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :comment_replies do
     def recent
       find(:all,:order => 'created_at desc')
     end
  end
end
