class Friendship < ActiveRecord::Base

  belongs_to :friendshipped_by_me,   :foreign_key => "user_id",   :class_name => "User"
  belongs_to :friendshipped_for_me,  :foreign_key => "friend_id", :class_name => "User"

  
   def randcode(n, m)
    words = ['a', 'b', 'c', '4', '5','6','d','e','f','g','7','8','9','0','h', 'i', 'j','k','l','m','n','o', 'p', 'q','r','s','t','u','v', 'w', 'x','y','z','1','2','3']
    if m.zero?
      []
    else
      s = self.randcode(n-1, m-1)
      t = words[rand(36)]
      s.concat s.include?(t) ? [n] : [t]
    end
  end
end

