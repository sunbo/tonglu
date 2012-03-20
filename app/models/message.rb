class Message < ActiveRecord::Base
  belongs_to :user
  
   def user_login
     user.login if user
   end

   def user_login=(name)
    self.user = User.find_or_create_by_login(name) unless name.blank?
   end

  def self.per_page() 
    6
  end
end
