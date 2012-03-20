 class PasswordsController < ApplicationController
  before_filter :not_logged_in_required, :only => [:new, :create]

   # Enter email address to recover password
   def new
   end

   # Forgot password action
   def create
     return unless request.post?
   if @user = User.find_for_forget(params[:email])
       @user.forgot_password
       @user.save
       flash[:notice] = "一封密码重置确认信已经发送到您的邮箱里，请登录您的邮箱确认"
     redirect_to login_path
     else
       flash[:error] = "您输入的Email地址不正确"
       render :action => 'new'
     end
   end

   # Action triggered by clicking on the /reset_password/:id link recieved via email
   # Makes sure the id code is included
   # Checks that the id code matches a user in the database
   # Then if everything checks out, shows the password reset fields
   def edit
     if params[:id].nil?
       render :action => 'new'
       return
     end
     @user = User.find_by_password_reset_code(params[:id]) if params[:id]
     raise if @user.nil?
   rescue
     logger.error "Invalid Reset Code entered."
     flash[:error] = "您的密码重置确认码不正确，请再次检查确认码后重新确认（可能您的邮件客户端在链接内插入空格？）"
     #redirect_back_or_default('/')
     redirect_to new_user_path
   end

   # Reset password action /reset_password/:id
   # Checks once again that an id is included and makes sure that the password field isn't blank
   def update
     if params[:id].nil?
       render :action => 'new'
       return
     end
     if params[:password].blank?
       flash[:error] = "请输入您的新密码"
       render :action => 'edit', :id => params[:id]
       return
     end
     @user = User.find_by_password_reset_code(params[:id]) if params[:id]
     raise if @user.nil?
     return if @user unless params[:password]
       if (params[:password] == params[:password_confirmation])
       #Uncomment and comment lines with @user to have the user logged in after reset - not recommended
         #self.current_user = @user #for the next two lines to work
         #current_user.password_confirmation = params[:password_confirmation]
         #current_user.password = params[:password]
         #@user.reset_password
     #flash[:notice] = current_user.save ? "Password reset" : "Password not reset"
     @user.password_confirmation = params[:password_confirmation]
     @user.password = params[:password]
     @user.reset_password
     flash[:notice] = @user.save ? "密码重置成功" : "密码重置失败"
       else
         flash[:error] = "两次输入的密码不一致"
         render :action => 'edit', :id => params[:id]
       return
       end
       redirect_to login_path
   rescue
     logger.error "Invalid Reset Code entered"
     flash[:error] = "您的密码重置确认码不正确，请再次检查确认码后重新确认（可能您的邮件客户端在链接内插入空格？）"
     redirect_to new_user_path
   end

 end

