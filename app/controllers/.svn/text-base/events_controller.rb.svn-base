class EventsController < ApplicationController
before_filter :login_required
  # GET /events
  # GET /events.xml
  def index
    #u
    @date = Time.parse("#{params[:date]} || Time.now")
    @events = Event.find(:all, :conditions => ['user_id = ? and date between ? and ?', current_user.id ,@date.strftime("%Y-%m") + '-01', @date.next_month.strftime("%Y-%m") + '-01'])
    @posts = Entry.find(:all, :conditions => ['user_id = ? and created_at between ? and ?', current_user.id ,@date.strftime("%Y-%m") + '-01', @date.next_month.strftime("%Y-%m") + '-01'])
    @lines = LineDetail.find(:all, :conditions => ['user_id = ? and startdate between ? and ?', current_user.id ,@date.strftime("%Y-%m") + '-01', @date.next_month.strftime("%Y-%m") + '-01'])
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    u
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    u
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    u
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    u
    @event = current_user.events.build(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = '事件添加成功'
        format.html { redirect_to @event and return true }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        flash[:error] = '事件添加失败，请重新操做'
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    u
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def u
    @posts = current_user.entries.recent
    @users = User.find_by_sql("select * from users order by rand() limit 3")
    @user = User.find(current_user)
  end
end
