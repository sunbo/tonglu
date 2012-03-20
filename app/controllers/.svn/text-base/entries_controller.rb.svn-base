class EntriesController < ApplicationController
  before_filter :login_required, :except =>[:index, :show]
  # GET /entries
  # GET /entries.xml
  def index
    @user = User.find(params[:user_id])
    @entries = @user.entries.paginate(:page => params[:page],:order => "created_at desc")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
      format.json  { render :text => @entries.to_json}
    end
  end

  # GET /entries/1
  # GET /entries/1.xml
  def show
    @user = User.find(params[:user_id])
    @entry = Entry.find_by_id_and_user_id(params[:id],
                                          params[:user_id],
                                          :include => [:user,[:entry_comments => :user]])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = current_user.entries.find(params[:id])
  end

  # POST /entries
  # POST /entries.xml
  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if current_user.entries << @entry
        flash[:notice] = '您的日记已成功保存！'
        format.html { redirect_to user_entry_path(:user_id => current_user,:id =>@entry) }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        flash[:error] = '日记保存失败，请重新操作'
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = current_user.entries.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        flash[:notice] = '你已经成功的更新了你的日记！'
        format.html { redirect_to user_entry_path(:user_id => current_user,:id =>@entry) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = current_user.entries.find(params[:id])
    @entry.destroy

    respond_to do |format|
      flash[:notice] = '日记删除成功'
      format.html { redirect_to blogs_path }
      format.xml  { head :ok }
    end
  end
end
