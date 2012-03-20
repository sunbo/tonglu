class ProfileController < ApplicationController
  before_filter :login_required
  #in_place_edit_for :detail,:sex
  def index
    u
    #@posts = Post.recent
    #@users = User.find(:all,  :order => :random, :limit =>3)
  end

  def show
    u
    e
  end

  def edit
    u
    e
    @detailslook = params[:detailslook] || @detail.is_show_details
    @imslook = params[:imslook] || @detail.is_show_ims
    @workslook = params[:workslook] || @detail.is_show_works
 end

  def look
    @detailslook = params[:detailslook]
    @imslook = params[:imslook]
    @workslook = params[:workslook]
    @user = current_user.detail
    @user.update_attribute(:is_show_details, @detailslook) if @detailslook = params[:detailslook]
     @user.update_attribute(:is_show_ims, @imslook) if @imslook = params[:imslook]
     @user.update_attribute(:is_show_works, @workslook) if @workslook = params[:workslook]
     flash[:notice] = "<strong>隐私设置</strong>成功！"
    redirect_to :action => :edit,:detailslook => @detailslook,:imslook => @imslook,:workslook => @workslook
  end
  
  def update
    u
    e
    case params[:switch]
    when 'detail'
      #验证生日和城市的选择
      birthday = (params[:detail][:"birthday(1i)"] +"-"+ params[:detail][:"birthday(2i)"] +"-"+params[:detail][:"birthday(3i)"]).to_s
      city = params[:detail][:city]
      if birthday == Time.now.strftime("%Y-%m-%d").to_s
       params[:detail][:"birthday(1i)"] = ''
       params[:detail][:"birthday(2i)"] = ''
       params[:detail][:"birthday(3i)"] = ''
      end
      if city == "选择城市"
        params[:detail][:city] = nil
      end
      #验证生日和城市的选择结束
      if @detail.update_attributes params[:detail]
        flash[:notice] = "个人基本资料保存成功"
        redirect_to :action => :edit
      else
        render :action => :edit
      end
      when 'photo'
      if @detail.update_attributes params[:detail]
        flash[:notice] = "个人图片保存成功"
        redirect_to :action => :edit
      else
        #flash.now[:error] = @detail.errors
        render :action => :edit
      end
    when 'password'
       return unless request.post?
         if User.authenticate(current_user.email, params[:old_password])
           if ((params[:password] == params[:password_confirmation]) && !params[:password_confirmation].blank?)
             current_user.password_confirmation = params[:password_confirmation]
             current_user.password = params[:password]
          if current_user.save
               flash[:notice] = "密码更新成功"
               redirect_to :action => 'edit'
             else
               flash.now[:error] = "密码更新失败，请重新操作"
               render :action => 'edit'
             end
           else
             flash.now[:error] = "两次输入的密码不一样"
             @old_password = params[:old_password]
             render :action => 'edit'
           end
          else
           flash.now[:error] = "您填写的旧密码不正确"
           render :action => 'edit'
         end
      end
  end

  def setting
    u
  end
  
  def update_setting
    u
    if @detail.update_attributes params[:detail]
        flash[:notice] = "设置成功"
        redirect_to :action => :setting
      else
        flash.now[:error] = "设置失败，请重新操作"
        render :action => :setting
      end
  end

  #查看别人主页
  def showuser
    id = params[:id]
    @showuser = User.find(id)
    @detail = @showuser.detail
    @comments = Comment.find(:all,:conditions => ['user_id = ?', id],:order => "created_at desc",:limit => 5)
    @schools = School.find(:all,:conditions => ["user_id = ?",id],:order => "created_at asc")
    @educations =  Education.find(:all,:conditions => ["user_id = ?",id],:order => "created_at asc")
    @works =  Work.find(:all,:conditions => ["user_id = ?",id],:order => "created_at asc")
    @states = State.find(:first,:conditions => ["user_id = ?",id],:order => "created_at desc")
    @entries = @showuser.entries.find(:all, :limit => 3, :order => "created_at desc")
  end
  protected
  def u
    @user = User.find(current_user)
    @detail = @user.detail
    @states = State.find(:first,:conditions => ["user_id = ?",current_user.id],:order => "created_at desc")
  end
  def e
    @schools = School.find(:all,:conditions => ["user_id = ?",current_user.id],:order => "created_at asc")
    @educations =  Education.find(:all,:conditions => ["user_id = ?",current_user.id],:order => "created_at asc")
    @works =  Work.find(:all,:conditions => ["user_id = ?",current_user.id],:order => "created_at asc")
 
  end
end
