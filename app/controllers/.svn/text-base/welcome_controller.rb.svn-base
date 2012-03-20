class WelcomeController < ApplicationController
  before_filter :login_required, :except => :index

  def index
    if logged_in?
      redirect_to home_path
    else
      @users = User.find(:all, :order => 'activated_at DESC', :limit =>10)
      #@admin_posts = Entry.find_by_sql("select * from entries where user_id = 1 order by updated_at DESC limit 5")
    end
  end
  
  def home
    @friends = User.find_by_sql("select distinct users.* from users, friendships where ((friendships.user_id = users.id and friendships.friend_id = #{current_user.id}) or (friendships.friend_id = users.id and friendships.user_id = #{current_user.id})) and friendships.accepted_at is not null order by status DESC ,accepted_at DESC limit 5")
    @entries = current_user.entries.recent
    #@lines = current_user.lines.recent
    @users = User.find_by_sql("select * from users where id not in( #{current_user.id})order by rand() limit 5")
    @user = User.find(current_user)
    @showuser = @user
    @state = State.find(:first,:conditions => ['user_id = ? ',current_user.id],:order => 'created_at DESC')
    @date = Time.parse("#{params[:date]} || Time.now")
    @events = Event.find(:all, :conditions => ['user_id = ? and date between ? and ?', current_user.id,@date.strftime("%Y-%m") + '-01', @date.next_month.strftime("%Y-%m") + '-01'])
    @e_posts = Entry.find(:all, :conditions => ['user_id = ? and created_at between ? and ?', current_user.id ,@date.strftime("%Y-%m") + '-01', @date.next_month.strftime("%Y-%m") + '-01'])
    @lines = LineDetail.find(:all, :conditions => ['user_id = ? and startdate between ? and ?', current_user.id ,@date.strftime("%Y-%m") + '-01', @date.next_month.strftime("%Y-%m") + '-01'])
    @comments = Comment.find(:all,:conditions => ['user_id = ?', current_user.id],:order => "created_at desc",:limit => 5)
    @works = Work.find(:first,:conditions => ['user_id = ? and workspan = ? ',current_user.id,'1'])
    #当天的行程，日记，线路
    @today_events = Event.find(:all, :conditions => ['user_id = ? and date between ? and ?', current_user.id, Time.now.strftime("%Y-%m-%d") + ' 00:00:00',Time.now.strftime("%Y-%m-%d") + ' 23:59:59'])
    @today_posts = Entry.find(:all, :conditions => ['user_id = ? and created_at between ? and ?', current_user.id, Time.now.strftime("%Y-%m-%d") + ' 00:00:00',Time.now.strftime("%Y-%m-%d") + ' 23:59:59'])
    @today_lines = LineDetail.find(:all, :conditions => ['user_id = ? and startdate between ? and ?', current_user.id,Time.now.strftime("%Y-%m-%d") + ' 00:00:00',Time.now.strftime("%Y-%m-%d") + ' 23:59:59'])
  end


 def show_data
   @events = params[:events]
   @posts = params[:posts]
   @lines = params[:lines]
   @date = Time.parse("#{params[:date]}")
 end
 
end
