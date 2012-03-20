class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += '请激活您在伴我网上的帐户'
    @body[:url]  = "#{HOST}/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @subject    += '您在同路人网站上的帐户已经激活'
    @body[:url]  = "#{HOST}"
  end

  def forgot_password(user)
    setup_email(user)
    @subject    += '点击下边链接重置您的密码'
    @body[:url]  = "#{HOST}/reset_password/#{user.password_reset_code}"
  end

  def reset_password(user)
    setup_email(user)
    @subject    += '您的密码已经被更改'
  end
  
  def fellowinvite_mail(user,email,code,content)
    @recipients  = "#{email}"
    #@from        = "#{user.email}"
    @from        = "webmaster@sameroads.com"
    @subject    = '点击下边链接加入伴我'
    @sent_on     = Time.now
    @body[:user] = user
    @body[:url]  = "#{HOST}/reg/#{user.id}/#{code}"
    @body[:content] = content
  end
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "webmaster@sameroads.com"
      @subject     = "您在伴我网上的注册信息"
      @sent_on     = Time.now
      @body[:user] = user
      @content_type = 'text/html'
    end
end