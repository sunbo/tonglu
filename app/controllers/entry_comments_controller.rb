class EntryCommentsController < ApplicationController
  before_filter :login_required
  
  # POST /entry_comments
  # POST /entry_comments.xml
  def create
    user_id = params[:user_id]
    body = params[:body]
    entry_id = params[:entry_id]
     respond_to do |wants|
       if body != nil && !body.empty?
        @entry = Entry.find_by_user_id_and_id(user_id,entry_id)
        @entry_comment = EntryComment.new(:user_id => current_user.id,:body => body)
        @entry.entry_comments << @entry_comment
         wants.js do
             render :update do |page|
              page.insert_html :bottom, "comment",:partial => 'entries/entry_comment', :object => @entry_comment
              page.visual_effect :highlight, "entry_comment_#{@entry_comment.id}"
              page << "jq('#body').val('');"
            end
         end
       else
         wants.js do
             render :update do |page|
                 page.alert "请填写评论内容"
             end
         end
       end
     end
  end


  # DELETE /entry_comments/1
  # DELETE /entry_comments/1.xml
  def destroy
    @entry = Entry.find_by_user_id_and_id(current_user.id,params[:entry_id],:include => :user)
    @entry_comment = @entry.entry_comments.find(params[:id])
    @entry_comment.destroy

    respond_to do |format|
      flash[:notice] = '删除成功！'
      format.html { redirect_to user_entry_path(:user_id => @entry.user.id,:id => @entry.id) }
      format.xml  { head :ok }
    end
  end
end
