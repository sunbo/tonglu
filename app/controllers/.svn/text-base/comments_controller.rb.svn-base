class CommentsController < ApplicationController
    before_filter :login_required

 #在showuser页面给好友留言
  def create
    write_id = params[:write_id]
    body = params[:cbody]
   respond_to do |wants|
         if body != nil && !body.empty?
           #添加内容
           @comment = Comment.new()
           @comment.user_id = write_id
           @comment.write_id = current_user.id
           @comment.content = body
           @comment.save
            wants.js do
              render :update do |page|
              page.insert_html :top, "comment_list",:partial => 'comments/comment', :object => @comment
              page.visual_effect :highlight, "comment_#{@comment.id}"
                page << "jq('#cbody').val('');"
                page << "tb_remove()"
              end
            end
         else
             if body == nil || body.empty?
               wants.js do
                  render :update do |page|
                    page.alert "请填写留言内容"
                  end
                end
             end
         end
      end
  end

    #回复留言
  def reply
    comment_id = params[:comment_id]
    body = params["rbody"+"_"+comment_id]
    respond_to do |wants|
         if body != nil && !body.empty?
           #添加内容
           @comment_reply = CommentReply.new()
           @comment_reply.user_id = current_user.id
           @comment_reply.comment_id = comment_id
           @comment_reply.content = body
           @comment_reply.save
            wants.js do
              render :update do |page|
              page.insert_html :top, "comment_reply_#{comment_id}",:partial => 'comments/comment_reply', :object => @comment_reply
              page.visual_effect :highlight, "comment_reply_#{@comment_reply.id}"
                page << "jq('#rbody_#{comment_id}').val('');"
                page << "tb_remove()"
              end
            end
         else
             if body == nil || body.empty?
               wants.js do
                  render :update do |page|
                    page.alert "请填写回复内容"
                  end
                end
             end
         end
      end
  end


end
