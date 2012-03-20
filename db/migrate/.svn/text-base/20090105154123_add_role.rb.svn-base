class AddRole < ActiveRecord::Migration
  def self.up

       Role.create(:rolename => 'administrator')
       Role.create(:rolename => 'moderator')

       user = User.new
       user.login = "admin"
       user.email = "admin@gmail.com"
       user.password = "123456"
       user.password_confirmation = "123456"
       user.save(false)
       user.send(:activate!)
       
       role = Role.find_by_rolename('administrator')
       user = User.find_by_login('admin')
       permission = Permission.new
       permission.role = role
       permission.user = user
       permission.save(false)

       role = Role.find_by_rolename('moderator')
       user = User.find_by_login('admin')
       permission = Permission.new
       permission.role = role
       permission.user = user
       permission.save(false)
  end

  def self.down
    Role.find_by_rolename('administrator').destroy
    Role.find_by_rolename('moderator').destroy
    User.find_by_login('admin').destroy
  end
end
