class StatesController < ApplicationController
  before_filter :login_required

  #添加现在状态
  def create
    user_id = params[:user_id]
    body = params[:body]
    respond_to do |wants|
         if body != "我正在......让好友们知道我在做什么"
           @state = State.new()
           @state.user_id = user_id
           @state.body = body
           @state.save
            wants.js do
              render :update do |page|
                page << "jq('#body').val('我正在......让好友们知道我在做什么');"
                page.replace_html "state","状态：#{body}"
                page.replace_html "state_date", "[刚刚更新]"
                page.visual_effect :highlight, "state".to_sym
              end
            end
         else
            wants.js do
                render :update do |page|
                    page.alert "请填写内容"
                  end
              end
         end
      end
    end


  #更多小博客
  def more_state
    @more_state = current_user.states.paginate(:page => params[:page],:order => "created_at desc")
  end
  #删除
  def destroy
      @state = current_user.states.find(params[:id])
      @state.destroy
      flash[:notice] = '删除成功'
      redirect_to :back
  end

  def update
    body = params[:body]
    @state = State.new()
    @state.user_id = current_user.id
    @state.body = body
    @state.save
     flash[:notice] = '添加成功'
    redirect_to :action => "more_state"
  end
end
