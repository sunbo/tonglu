class LinesController < ApplicationController
 before_filter :login_required
 before_filter :get_user
  # GET /lines
  # GET /lines.xml
  def index
    @lines = current_user.line_details.paginate(:page => params[:page],:order => "startdate desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lines }
    end
  end

  # GET /lines/1
  # GET /lines/1.xml
  def show
    @line = @user.line_details.find(params[:id])
    @lineadminuser = LineUser.find_all_by_line_id_and_status(params[:id],'admin')
    @lineuser = LineUser.find_all_by_line_id_and_status(params[:id],'user')
    @lineplaces = LinePlace.find_all_by_line_id(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line }
    end
  end

  # GET /lines/new
  # GET /lines/new.xml
  def new
    @line_detail = current_user.line_details.build
    @airlinesname = params[:airlinesname]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line_detail }
    end
  end

  # GET /lines/1/edit
  def edit
    @line_detail = current_user.line_details.find(params[:id])
  end

  # POST /lines
  # POST /lines.xml
  def create
    @line_detail = current_user.line_details.build(params[:line_detail])
    respond_to do |format|
      if @line_detail.save
        flash[:notice] = '你的出行信息已成功保存！'
        format.html { redirect_to line_path(:user => current_user,:id =>@line_detail) }
      else
        flash[:error] = '出行信息保存失败，请重新操作'
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /lines/1
  # PUT /lines/1.xml
  def update
    @line = current_user.line_details.find(params[:id])

    respond_to do |format|
      if @line.update_attributes(params[:line_detail])
        flash[:notice] = '你已经成功的更新了你的出行信息！'
        format.html { redirect_to line_path(:user => current_user,:id =>@line) }
        format.xml  { head :ok }
      else
        flash[:error] = '出行信息更新失败，请重新操作！'
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lines/1
  # DELETE /lines/1.xml
  def destroy
    @line = current_user.line_details.find(params[:id])
    @line.destroy

    respond_to do |format|
      flash[:notice] = '出行信息删除成功'
      format.html { redirect_to lines_path(:user => current_user) }
      format.xml  { head :ok }
    end
  end

  def friendlines
    @friendlines = current_user.friends
  end

  def search
    @search_lines = @search_lines
  end
   #查找路线
  def searchline
    return unless request.post?
    @title = params[:title]
    @status = params[:status]
    @body = params[:body]
    @startdate = params[:startdate]
    @enddate = params[:enddate]
    @startcity = params[:startcity]
    @endcity = params[:endcity]
    @airlinesname = params[:airlinesname]
    @number = params[:number]
    if @title.blank?  && @status.blank? && @body.blank? && @startdate.blank? && @enddate.blank? && @startcity == "选择城市"&& @endcity == "选择城市"&& @airlinesname.blank? && @number.blank?
        flash[:error] = "请至少填写一个条件"
         redirect_to :action => 'search'
       else
        conditions = "1 = 1"
        conditions << " and  title like '%#{@title}%'" unless @title.blank?
        conditions << " and  status = '#{@status}'" unless @status.blank?
        conditions << " and  body like '%#{@body}%'" unless @body.blank?
        conditions << " and  startcity = '#{@startcity}'" unless @startcity == "选择城市"
        conditions << " and  endcity = '#{@endcity}'" unless @endcity == "选择城市"
        conditions << " and  airlinesname = '#{@airlinesname}'" unless @airlinesname.blank?
        conditions << " and  number = '#{@number}'" unless @number.blank?
        conditions << " and  startdate = '#{@startdate}'" unless @startdate.blank?
        conditions << " and  enddate = '#{@enddate}'" unless @enddate.blank?
        @search_lines = LineDetail.paginate(:page => params[:page],:conditions => conditions,:order => "startdate desc")
     end

  end

  def changecity
    id = params[:id]
    @linedetail = LineDetail.find(id)
    @line_places = LinePlace.find_all_by_line_id(id)
  end

  def editcity
    line_id = params[:line_id]
    places = params[:line_place_ids]
    @lineplace =  LinePlace.find_all_by_line_id(line_id)
    i = 0
    for lineplace in @lineplace
        lineplace.place = places[i]
        lineplace.save
        i += 1
    end
    flash[:notice] = '目的地编辑成功'
    redirect_to line_path(:user => current_user,:id => line_id)
  end

  #地图－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
  def addmap
    @line_map = current_user.line_maps.build
    @id = params[:id]
    @line_id = params[:line_id]
  end

  def createmap
   @line_map = current_user.line_maps.build(params[:line_map])
   @line_map.line_place_id = params[:line_place_id]
    respond_to do |format|
      if @line_map.save
        flash[:notice] = '地图编辑成功！'
        format.html { redirect_to line_path(:user => current_user,:id => params[:line_id]) }
      else
        flash[:error] = '地图编辑保存失败，请重新操作'
        format.html { redirect_to addmap_path(:user => current_user,:id => params[:line_place_id],:line_id =>params[:line_id]) }
      end
    end
  end
  def destroymap
    @line_map = LineMap.find(params[:map_id])
    @line_map.destroy

    respond_to do |format|
      flash[:notice] = '信息删除成功'
      format.html { redirect_to line_path(:user => current_user,:id => params[:line_id]) }
      format.xml  { head :ok }
    end
  end

  def editmap
    @id = params[:map_id]
    @line_id = params[:line_id]
    @line_map = LineMap.find(@id)
  end

  def updatemap
    @id = params[:id]
    @line_map = LineMap.find(@id)
    @line_map.update_attributes(params[:line_map])
    respond_to do |format|
      flash[:notice] = '更新成功'
      format.html { redirect_to line_path(:user => current_user,:id => params[:line_id]) }
      format.xml  { head :ok }
    end
  end
  #地图结束－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
  #
  #备忘录－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
  def addnote
    @line_note = current_user.line_notes.build
    @id = params[:id]
    @line_id = params[:line_id]
  end

  def createnote
   @line_note = current_user.line_notes.build(params[:line_note])
   @line_note.line_place_id = params[:line_place_id]
    respond_to do |format|
      if @line_note.save
        flash[:notice] = '备忘录编辑成功！'
        format.html { redirect_to line_path(:user => current_user,:id => params[:line_id]) }
      else
        flash[:error] = '备忘录编辑保存失败，请重新操作'
        format.html { redirect_to addnote_path(:user => current_user,:id => params[:line_place_id],:line_id =>params[:line_id]) }
      end
    end
  end

  def destroynote
    @line_note = LineNote.find(params[:note_id])
    @line_note.destroy

    respond_to do |format|
      flash[:notice] = '信息删除成功'
      format.html { redirect_to line_path(:user => current_user,:id => params[:line_id]) }
      format.xml  { head :ok }
    end
  end
  
  def editnote
    @id = params[:note_id]
    @line_id = params[:line_id]
    @line_note = LineNote.find(@id)
  end

  def updatenote
    @id = params[:id]
    @line_note = LineNote.find(@id)
    @line_note.update_attributes(params[:line_note])
    respond_to do |format|
      flash[:notice] = '更新成功'
      format.html { redirect_to line_path(:user => current_user,:id => params[:line_id]) }
      format.xml  { head :ok }
    end
  end
  #备忘录结束－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－

 #文章－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
  def addarticle
    @line_article = current_user.line_articles.build
    @id = params[:id]
    @line_id = params[:line_id]
  end

  def createarticle
   @line_article = current_user.line_articles.build(params[:line_article])
   @line_article.line_place_id = params[:line_place_id]
    respond_to do |format|
      if @line_article.save
        flash[:notice] = '文章编辑成功！'
        format.html { redirect_to line_path(:user => current_user,:id => params[:line_id]) }
      else
        flash[:error] = '文章编辑保存失败，请重新操作'
        format.html { redirect_to addarticle_path(:user => current_user,:id => params[:line_place_id],:line_id =>params[:line_id]) }
      end
    end
  end

  def destroyarticle
    @line_article = LineArticle.find(params[:article_id])
    @line_article.destroy

    respond_to do |format|
      flash[:notice] = '信息删除成功'
      format.html { redirect_to line_path(:user => current_user,:id => params[:line_id]) }
      format.xml  { head :ok }
    end
  end

  def editarticle
    @id = params[:article_id]
    @line_id = params[:line_id]
    @line_article = LineArticle.find(@id)
  end

  def updatearticle
    @id = params[:id]
    @line_article = LineArticle.find(@id)
    @line_article.update_attributes(params[:line_article])
    respond_to do |format|
      flash[:notice] = '更新成功'
      format.html { redirect_to line_path(:user => current_user,:id => params[:line_id]) }
      format.xml  { head :ok }
    end
  end
  #文章结束－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－

   #活动－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
  def addcontent
    @line_content = current_user.line_contents.build
    @id = params[:id]
    @line_id = params[:line_id]
  end

  def createcontent
   @line_content = current_user.line_contents.build(params[:line_content])
   @line_content.line_place_id = params[:line_place_id]
    respond_to do |format|
      if @line_content.save
        flash[:notice] = '活动编辑成功！'
        format.html { redirect_to line_path(:user => current_user,:id => params[:line_id]) }
      else
        flash[:error] = '活动编辑保存失败，请重新操作'
        format.html { redirect_to addcontent_path(:user => current_user,:id => params[:line_place_id],:line_id =>params[:line_id]) }
      end
    end
  end

  def destroycontent
    @line_content = LineContent.find(params[:content_id])
    @line_content.destroy

    respond_to do |format|
      flash[:notice] = '信息删除成功'
      format.html { redirect_to line_path(:user => current_user,:id => params[:line_id]) }
      format.xml  { head :ok }
    end
  end

  def editcontent
    @id = params[:content_id]
    @line_id = params[:line_id]
    @line_content = LineContent.find(@id)
  end

  def updatecontent
    @id = params[:id]
    @line_content = LineContent.find(@id)
    @line_content.update_attributes(params[:line_content])
    respond_to do |format|
      flash[:notice] = '更新成功'
      format.html { redirect_to line_path(:user => current_user,:id => params[:line_id]) }
      format.xml  { head :ok }
    end
  end
  #活动结束－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
  #
#管理人员－－－－－－－－－－－－－－－－－－－－－－
  def manageuser
    @id = params[:id]
    @line_detail = LineDetail.find(@id)
    @line_users =  LineUser.find_all_by_line_id(@id)
  end

   def unenable
     @user = LineUser.find(params[:id])
     if @user.update_attribute(:status, 'user')
       flash[:notice] = "修改成功"
     else
       flash[:error] = "修改失败，请重新操作"
     end
     redirect_to :action => 'manageuser',:id => @user.line_id
   end

   def enable
     @user = LineUser.find(params[:id])
     if @user.update_attribute(:status, 'admin')
       flash[:notice] = "修改成功"
     else
       flash[:error] = "修改失败，请重新操作"
     end
       redirect_to :action => 'manageuser',:id => @user.line_id
   end
   #管理人员结束－－－－－－－－－－－－－－－－－－－－－－
   def invite
    @id = params[:id]
    @line_detail = LineDetail.find(@id)
   end
end