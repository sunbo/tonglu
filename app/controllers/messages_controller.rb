class MessagesController < ApplicationController
  before_filter :login_required
  auto_complete_for :message,:user_login

  #收件箱
  def index
    @messages = Message.paginate(:page => params[:page],:conditions => ["isdeleted = false  and receiver_id = ?", current_user],:order => "created_at desc")
  end

  #发件箱
  def outbox
    @messages = Message.paginate(:page => params[:page],:conditions => ["isdeleted = false  and user_id = ?", current_user],:order => "created_at desc")
  end

  #回收站
  def trash
    @messages = Message.paginate(:page => params[:page],:conditions => ["isdeleted = true  and user_id = ? ", current_user],:order => "created_at desc")
  end

  #在收件箱里看短信，把状态置换成已读
  def show_in
    @message = Message.find(params[:id])
    @message.update_attribute(:receive_at, Time.now)
    redirect_to :action => 'show',:id => @message.flag, :anchor => "message_#{@message.id}"
  end
  #已看邮件
  def show_old
    @message = Message.find(params[:id])
    redirect_to :action => 'show',:id => @message.flag, :anchor => "message_#{@message.id}"
  end
 #正常看短信
  def show
    @message = Message.find(params[:id])
    @receiver = Message.find(:first,:conditions => ["flag = ? and receiver_id = ?", params[:id], current_user.id])
    @all_message = Message.find(:all,:conditions => ["flag = ?", params[:id]],:order => "created_at asc")
  end
  
  #回复
 def reply
    friend_id = params[:friend_id]
    #title = params[:title]
    message_id = params[:message_id]
    body = params[:rbody]
    #@all_message = Message.find(:all,:conditions => ["flag = ?", message_id],:order => "created_at asc")
   respond_to do |wants|
         if body != nil && !body.empty?
           #添加内容
           @message = Message.new()
           @message.user_id = current_user.id
           @message.user_name = current_user.login
           @message.receiver_id = friend_id
           #@message.title = title
           @message.content = body
           @message.smstype = "0"
           @message.save
           @message.update_attribute(:flag, message_id)
            wants.js do
              render :update do |page|
              page.insert_html :bottom, "message_to_message",:partial => 'messages/message', :object => @message
              page.visual_effect :highlight, "message_#{@message.id}"
              page << "jq('#rbody').val('');"
              end
            end
         else
            wants.js do
                render :update do |page|
                    page.alert "请填写回复内容"
                  end
              end
         end
      end
  end
  #把短信删除到回收站里（只有自己发的才能删除）
   def totrash
      @message = Message.find(params[:id])
      @allmessage = Message.find(:all,:conditions => ["flag = ?", params[:id]])
      for m in @allmessage
      m.update_attribute(:isdeleted, true)
      end
       flash[:notice] = "短信被移到回收站"
       redirect_to :action => 'trash'
   end
   #恢复短信
   def toinbox
      @message = Message.find(params[:id])
      @message.update_attribute(:isdeleted, false)
      flash[:notice] = "短信恢复成功"
      redirect_to :action => 'outbox'
   end
   #彻底删除短信
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
   flash[:notice] = '短信删除成功'
   redirect_to :action => 'trash'
  end
   
  #发信息
  def new
  end
  #在new页面发短信
  def create_message
    #检查有没有收件人
    @login = params[:message][:user_login]
    #@title = params[:title]
    @body = params[:body]
    @isuser = User.find_by_login(@login)
    #if @isuser != nil && @login != nil && @login != ''&& @title != nil && @title != ''&& @body != nil&& @body != ''
     if @isuser != nil && @login != nil && @login != ''&&  @body != nil&& @body != ''
      #存内容
      @message = Message.new()
      @message.user_id = current_user.id
      @message.user_name = current_user.login
      @message.receiver_id = @isuser.id
      #@message.title = @title
      @message.content = @body
      @message.smstype = "0"
      if @message.save
        @message.update_attribute(:flag, @message.id)
        flash[:notice] = "给#{@login}发送短信成功"
        redirect_to :action => 'new'
      else
        flash.now[:error] = "发送短信失败"
        render :action => 'new'
      end
    else
      if @login == nil || @login == ''
        flash.now[:error] = "请填写收件人名字"
        render :action => 'new'
      elsif @isuser == nil 
        flash.now[:error] = "没有此收件人"
        render :action => 'new'
#      elsif @title == nil || @title == ''
#        flash.now[:error] = "请填写标题"
#        render :action => 'new'
      elsif @body == nil || @body == ''
        flash.now[:error] = "请填写内容"
        render :action => 'new'
      end
    end
  end
  
  #在showuser页面给好友发信息
  def create
    friend_id = params[:friend_id]
    #title = params[:title]
    body = params[:mbody]
   respond_to do |wants|
         #if body != nil && !body.empty? && title != nil && !title.empty?
         if body != nil && !body.empty?
           #添加内容
           @message = Message.new()
           @message.user_id = current_user.id
           @message.user_name = current_user.login
           @message.receiver_id = friend_id
           #@message.title = title
           @message.content = body
           @message.smstype = "0"
           @message.save
           @message.update_attribute(:flag, @message.id)
            wants.js do
              render :update do |page|
                page.alert "发送成功"
                page << "jq('#title,#mbody').val('');"
                page << "tb_remove()"
              end
            end
         else
             if body == nil || body.empty?
               wants.js do
                  render :update do |page|
                    page.alert "请填写短信息内容"
                  end
                end
#             elsif title == nil || title.empty?
#                 wants.js do
#                    render :update do |page|
#                      page.alert "请填写短信息标题"
#                    end
#                  end
             end
         end
      end
  end

end
