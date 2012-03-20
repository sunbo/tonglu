class FriendsController < ApplicationController
  before_filter :login_required, :except =>[ :reg,:regcreate]

  #好友首页
  def index
    @friends = User.find_by_sql("select distinct users.* from users, friendships where ((friendships.user_id = users.id and friendships.friend_id = #{current_user.id}) or (friendships.friend_id = users.id and friendships.user_id = #{current_user.id})) and friendships.accepted_at is not null order by status DESC ,accepted_at DESC ")
  end

  #查找好友
  def search
    return unless request.post?
    @name = params[:name]
    @city = params[:city]
    if( @name == nil || @name == '') && @city == "选择城市"
    flash[:error] = "请至少填写一个条件"
     render :action => 'search'
    else
    conditions = "details.id = users.id"
    conditions << " and  users.id <> '#{current_user.id}'"
    conditions << " and  details.city = '#{@city}'" unless @city == "选择城市"
    conditions << " and  users.login like '%#{@name}%'" unless @name.blank?
    @search_friends = Detail.find(:all,:conditions => conditions,:from => 'users, details',:order => "users.login desc")
  end
  end
  #邀请首页
  def invite
    @mailcode = Mailcode.find_by_user_id_and_email(current_user.id,"email")
    @content = "快来和我一起加入sameroads吧,让你的旅途不再寂寞！"
    @invite_url = "#{HOST}/reg/#{current_user.id}/#{@mailcode.mailcode}"
  end
 #邀请
  def update
    @email = params[:email]
    @content = params[:content]
    #验证
    error = validates_content
    if error != ''
     flash[:error] = error
     redirect_to :action => 'invite'
    else
      emails = @email.split(',')
      i=0
      for e in emails
      @randcode = Friendship.new.randcode(10000,6).join()
      @toemail = emails[i]
      email = UserMailer.create_fellowinvite_mail(current_user,@toemail,@randcode,@content)
      email.set_content_type("text/html")
      UserMailer.deliver(email)
      invite_mailcode(@toemail,@randcode)
      i += 1
      end
      flash[:notice] = "邀请发送成功"
      redirect_to :action=> 'invite'
    end
  end

#回复邀请
  def reg
    id = params[:id]
    code  = params[:code]
    c = code.split('_')
    if c[0] == "imurl"
     @reg = Mailcode.find_by_user_id_and_mailcode(id,code)
    else
    @reg = Mailcode.find_by_user_id_and_mailcode(id,code)
    end
    @users = User.find(id)
    if @reg
      if c[0] != "imurl"
          if @reg.reg_at == nil
          flash.now[:notice] = "欢迎您,#{@reg.email}"
        elsif @reg.reg_at != nil
          flash[:error] = "该链接已经被确认,如果是注册用户，请登录"
          redirect_to login_path
          end
      end
      flash.now[:notice] = "欢迎您"
    else
      flash[:error] = "验证码错误，请重新确认"
      redirect_to login_path
    end
  end
 #回复邀请的注册
  def regcreate
     cookies.delete :auth_token
     reg_mailcode = params[:reg_mailcode]
     reg_id = params[:reg_id]
     @reg = Mailcode.find_by_user_id_and_mailcode(reg_id,reg_mailcode)
     @users = User.find(reg_id)
     @user = User.new(params[:user])
     @user.save!
     @reg.update_attribute(:reg_at, Time.now)
     User.find(reg_id).become_friends_with(User.find(@user.id))
     @randcode = Friendship.new.randcode(10000,6).join()
      @mailcode = Mailcode.new()
      @mailcode.user_id =  @user.id
      @mailcode.email =  "email"
      @mailcode.mailcode =  "imurl"+"_"+@randcode
      @mailcode.save
     #Uncomment to have the user logged in after creating an account - Not Recommended
     #self.current_user = @user
     flash[:notice] = "感谢您的注册！请登录您注册时填写的邮箱激活此帐户"
     redirect_to login_path
     rescue ActiveRecord::RecordInvalid
     render :action => 'reg',:id =>reg_id,:code=>reg_mailcode
  end
  #加好友
  def create
   friend_id = params[:friend_id]
   body = params[:fbody]
   respond_to do |wants|
       if body != nil && !body.empty?
         #用户current_user.id加params[:friend_id]为好友
         current_user.request_friendship_with(User.find(friend_id))
         #在message里添加记录
         friend_message(friend_id,body)
          wants.js do
            render :update do |page|
              page.alert "发送成功"
              page << "jq('#fbody').val('');"
              page << "tb_remove()"
            end
          end
       else
         wants.js do
            render :update do |page|
              page.alert "请填写验证信息"
            end
          end
       end
     end
  end

  #同意加好友
  def agree
    current_user.accept_friendship_with(User.find(params[:user_id]))
         @message = Message.new()
         @message.user_id = current_user.id
         @message.user_name = current_user.login
         @message.receiver_id = params[:user_id]
         #@message.title = "#{current_user.login}邀请#{User.find(id).login}加为好友"
         @message.content = "#{current_user.login}同意#{User.find(params[:user_id]).login}并加#{User.find(params[:user_id]).login}为好友"
         @message.smstype = "0"
         @message.save
         @message.update_attribute(:flag, @message.id)
    flash[:notice] = "您和#{params[:user_name]}成为好友"
    redirect_to :back
  end
  
  private
     def invite_mailcode(email,randcode)
      @mailcode = Mailcode.new()
      @mailcode.user_id =  current_user.id
      @mailcode.email =  email
      @mailcode.mailcode =  randcode
      @mailcode.save
     end
  #加好友时同时在message表里添加一条记录
  def friend_message(id,body)
         @message = Message.new()
         @message.user_id = current_user.id
         @message.user_name = current_user.login
         @message.receiver_id = id
         #@message.title = "#{current_user.login}邀请#{User.find(id).login}加为好友"
         @message.content = "#{current_user.login}邀请#{User.find(id).login}加为好友<br/>" + body
         @message.smstype = "friend"
         @message.save
         @message.update_attribute(:flag, @message.id)
  end
  #验证邀请提交信息的完整性
  def validates_content
    error = ""
    if @email == ''
      error += "请至少填写一个Email<br/>"
    end
    if @name == ''
      error += "请填写你的姓名<br/>"
    end
    if @content == ''
      error += "请填写邀请内容<br/>"
    end
    return error
  end
  
end
