# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include ExceptionNotifiable
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'ada765b3b3d8ec8aa3b1b690e8849904'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  include AuthenticatedSystem
  before_filter :configure_charsets
  session :user_id => 1.hours.from_now
  
  def configure_charsets  
      response.headers["Content-Type"] = "text/html; charset=utf-8"
      suppress(ActiveRecord::StatementInvalid) do
        ActiveRecord::Base.connection.execute 'SET NAMES UTF8'
      end 
  end

  def update_subsel
        name = params['name']
        if name == "选择城市"
        ret = "<input class=\"text_login\" id=\"detail_airport\" name=\"detail[airport]\" onblur=\"($(this).className = 'text_login')\" onfocus=\"($(this).className = 'text_normal')\"  type=\"text\" readonly  = true value=\"\" />"
        elsif name == "其他"
          ret = "<input class=\"text_login\" id=\"detail_airport\" name=\"detail[airport]\" onblur=\"($(this).className = 'text_login')\" onfocus=\"($(this).className = 'text_normal')\"  type=\"text\"  />"
        else
          airport  = CityAirport.find_by_city_name(name)
          airport_name = airport.airport_name
          ret = "<input class=\"text_login\" id=\"detail_airport\" name=\"detail[airport]\" onblur=\"($(this).className = 'text_login')\" onfocus=\"($(this).className = 'text_normal')\"  type=\"text\" readonly  = true value=\""+ airport_name +"\" />"
        end
      render :text => ret
  end

  protected
  def get_user
    if !(@user = User.find(params[:user]))
      redirect_to :controller => 'welcome',:action => 'directory'
    end
  end

#   def rescue_action_in_public(exception)
#     render :file=>"#{RAILS_ROOT}/public/error.html"
#   end
#    def local_request?
#       false
#    end
end