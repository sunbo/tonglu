class PostsController < ApplicationController
   before_filter :login_required, :except => [:index, :show]
   before_filter :check_moderator_role, :only => [:edit,:update,:destroy]
  # GET /posts
  # GET /posts.xml
  def index
    @topic = Topic.find(params[:topic_id],:include => :forum)
    @posts = @topic.posts.paginate(:page => params[:page],
                                     :include => :user,
                                     :conditions => ['topic_id = ?', @topic],
                                     :order => "posts.updated_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @topic = Topic.find(params[:topic_id], :include => :forum)
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id], :include => {:topic => :forum})
  end

  # POST /posts
  # POST /posts.xml
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(:body => params[:post][:body],
                      :topic_id => @topic.id,
                       :user_id => current_user.id)

    respond_to do |format|
      if @post.save
        flash[:notice] = '回复成功'
        format.html { redirect_to forum_topic_posts_path(:forum_id => @topic.forum.id,
                                                          :topic_id => @topic) }
        format.xml  { render :xml => @post, :status => :created, :location => forum_topic_posts_path(@post) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = '编辑成功'
        format.html { redirect_to forum_topic_posts_path(:forum_id => params[:forum_id],
                                                          :topic_id => params[:topic_id]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      flash[:notice] = '删除成功'
      format.html { redirect_to forum_topic_posts_path(:forum_id => params[:forum_id],
                                                          :topic_id => params[:topic_id]) }
      format.xml  { head :ok }
    end
  end
end
