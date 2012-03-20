 class AccountsController < ApplicationController
   before_filter :login_required, :except => :show
   before_filter :not_logged_in_required, :only => :show
   # Activate action
   def show
     # Uncomment and change paths to have user logged in after activation - not recommended
     #self.current_user = User.find_and_activate!(params[:id])
   User.find_and_activate!(params[:id])
     flash[:notice] = "您的帐户激活成功，请登录"
     redirect_to login_path
   rescue User::ArgumentError
     flash[:error] = '激活码错误，请尝试重新注册一个用户'
     redirect_to new_user_path
   rescue User::ActivationCodeNotFound
     flash[:error] = '激活码错误，请尝试重新注册一个用户'
     redirect_to new_user_path
   rescue User::AlreadyActivated
     flash[:notice] = '您的帐户已经激活，请登录'
     redirect_to login_path
   end

   def edit
   end

   # Change password action
   def update
   return unless request.post?
     if User.authenticate(current_user.email, params[:old_password])
       if ((params[:password] == params[:password_confirmation]) && !params[:password_confirmation].blank?)
         current_user.password_confirmation = params[:password_confirmation]
         current_user.password = params[:password]
     if current_user.save
           flash[:notice] = "密码更新成功"
           redirect_to :action => 'edit'
         else
           flash[:error] = "密码更新失败，请重新操作"
           render :action => 'edit'
         end
       else
         flash[:error] = "两次输入的密码不一样"
         @old_password = params[:old_password]
         render :action => 'edit'
       end
     else
       flash[:error] = "您填写的旧密码不正确"
       render :action => 'edit'
     end
   end

 end

