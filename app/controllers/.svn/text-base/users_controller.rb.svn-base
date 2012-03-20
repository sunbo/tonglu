class UsersController < ApplicationController
   before_filter :not_logged_in_required, :only => [:new, :create]
   before_filter :login_required, :only => [:show, :edit, :update]
   before_filter :check_administrator_role, :only => [ :destroy, :enable,:all_users]

   
   def index
     @searchuser = User.find(:all, :conditions => ['login LIKE ?', "%#{params[:search]}%"])
   end

   #This show action only allows users to view their own profile
   def show
     @user = current_user
   end

   # render new.rhtml
   def new
     @user = User.new
   end

   def create
     cookies.delete :auth_token
     @user = User.new(params[:user])
     @user.save!
     #Uncomment to have the user logged in after creating an account - Not Recommended
     #self.current_user = @user
     @randcode = Friendship.new.randcode(10000,6).join()
      @mailcode = Mailcode.new()
      @mailcode.user_id =  @user.id
      @mailcode.email =  "email"
      @mailcode.mailcode =  "imurl"+"_"+@randcode
      @mailcode.save
     flash[:notice] = "感谢您的注册！请登录您注册时填写的邮箱激活此帐户"
     redirect_to login_path
     rescue ActiveRecord::RecordInvalid
     render :action => 'new'
   end

   def edit
     @user = current_user
     @userlist = User.find(:all)
   end

   def update
     @user = User.find(current_user)
     if @user.update_attributes(params[:user])
       flash[:notice] = "更新成功"
       redirect_to :action => 'show', :id => current_user
     else
       render :action => 'edit'
     end
   end

   def destroy
     @user = User.find(params[:id])
     if @user.update_attribute(:enabled, false)
       flash[:notice] = "账户被锁定"
     else
       flash[:error] = "账户锁定失败，请重新操作"
     end
     redirect_to :action => 'all_users'
   end

   def enable
     @user = User.find(params[:id])
     if @user.update_attribute(:enabled, true)
       flash[:notice] = "账户被解封"
     else
       flash[:error] = "账户解封失败，请重新操作"
     end
       redirect_to :action => 'all_users'
   end
   
  def all_users
    @users = User.find(:all)
  end
end
