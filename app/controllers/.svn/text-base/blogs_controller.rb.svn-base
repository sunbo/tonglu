class BlogsController < ApplicationController
  before_filter :login_required, :except =>:index

  def index
    @entries = Entry.paginate(:page => params[:page],:order => "created_at desc",:include => :user)
  end
end
