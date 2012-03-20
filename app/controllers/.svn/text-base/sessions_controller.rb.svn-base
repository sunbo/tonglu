    # This controller handles the login/logout function of the site.
    class SessionsController < ApplicationController
     before_filter :login_required, :only => :destroy
      before_filter :not_logged_in_required, :only => [:new, :create]

      # render new.rhtml
     def new
     end

   def create
      password_authentication(params[:email], params[:password])
     end

     def destroy
      self.current_user.forget_me if logged_in?
      self.current_user.logout_successful
      cookies.delete :auth_token
       reset_session
      flash[:notice] = "您已经安全退出"
    redirect_to login_path
     end

     protected


     def password_authentication(email, password)
       user = User.authenticate(email, password)
       if user == nil
        failed_login("您的Email或密码不正确")
      elsif user.activated_at.blank?
         failed_login("您的帐户还没有激活，请点击您注册时填写的邮箱里的激活链接激活")
       elsif user.enabled == false
        failed_login("您的帐户已经被管理员锁定，如有问题请与管理员联系")
       else
         self.current_user = user
         self.current_user.login_successful
        successful_login
       end
     end

     private

     def failed_login(message)
       flash.now[:error] = message
      render :action => 'new'
     end

    def successful_login
      if params[:remember_me] == "1"
        self.current_user.remember_me
         cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
       end
         flash[:notice] = "登录成功"
         return_to = session[:return_to]
         if return_to.nil?
          redirect_to home_path
         else
           redirect_to return_to
        end
     end

  end

