# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #中文错误信息
  def error_messages_for(object_name, options = {})
    options = options.symbolize_keys
    object = instance_variable_get("@#{object_name}")
    if object
      unless object.errors.empty?
        error_lis = []
        object.errors.each{ |key,msg| error_lis << content_tag("li", msg) }
        content_tag("div",
          content_tag(
            options[:header_tag] || "h2",
            "发生#{object.errors.count}个错误") +content_tag("ul", error_lis),"id" => options[:id] || "errorExplanation", "class" => options[:class] || "errorExplanation")
      end
    end
  end

  #显示侧栏个人头像
  def show_photo_medium
    if @user.detail && @user.detail.photo
      @detail = @user.detail
      return(url_for_file_column'detail','photo','medium')
    else
      return "/images/icons/photo_medium.png"
    end
  end

  #显示个人首页中头像
  def show_photo
    if @user.detail && @user.detail.photo
      @detail = @user.detail
      return(url_for_file_column'detail','photo','thumb')
    else
      return "/images/icons/userpicture.gif"
    end    
   end
   
   def show_photo_large
    if @user.detail && @user.detail.photo
      @detail = @user.detail
      return(url_for_file_column'detail','photo','large')
    else
      return "/images/icons/photo_medium.png"
    end    
   end

  #显示某个用户头像
  def get_photo(id)
    @photo = Detail.find_by_user_id(id)
    if @photo && @photo.photo
    return(url_for_file_column("photo", "photo", "thumb"))
    else
      return "/images/icons/userpicture.gif"
    end
  end

  def get_photo_medium(id)
    @photo = Detail.find_by_user_id(id)
    if @photo && @photo.photo
    return(url_for_file_column("photo", "photo", "medium"))
    else
      return "/images/icons/photo_medium.png"
    end
  end
  def get_photo_large(id)
    @photo = Detail.find_by_user_id(id)
    if @photo && @photo.photo
    return(url_for_file_column("photo", "photo", "large"))
    else
      return "/images/icons/photo_medium.png"
    end
  end
  #格式时间2008-10-10
  def nice_date(date)
    h date.strftime("%Y-%m-%d")
  end
  
  def masg_date(date)
    date.strftime("%Y年 %m月<br />%d日")  
  end
  
  #格式时间2009-10-10 21：10AM
  def nice_time(time)
    h time.strftime("%Y-%m-%d  %I:%M%p")
  end
  
  #查看是不是用户自己
  def show_admin_menu
    current_user == @user
  end
  
    #时间格式重写
  def distance_of_time_in_words(from_time, to_time = 0, include_seconds = false)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    distance_in_minutes = (((to_time - from_time).abs)/60).round
    distance_in_seconds = ((to_time - from_time).abs).round
    case distance_in_minutes
    when 0..1
      return (distance_in_minutes == 0) ? '不到1分钟' : '1分钟' unless include_seconds
      case distance_in_seconds
      when 0..4   then '不到5秒'
      when 5..9   then '不到10秒'
      when 10..19 then '不到20秒'
      when 20..39 then '半分钟'
      when 40..59 then '不到1分钟'
      else             '1分钟'
      end
      
    when 2..44           then "#{distance_in_minutes}分钟"
    when 45..89          then '大约1小时'
    when 90..1439        then "大约 #{(distance_in_minutes.to_f / 60.0).round}小时"
    when 1440..2879      then '1天'
    when 2880..43199     then "#{(distance_in_minutes / 1440).round}天"
    when 43200..86399    then '大约1个月'
    when 86400..525599   then "#{(distance_in_minutes / 43200).round}个月"
    when 525600..1051199 then '大约1年'
    else                      "#{(distance_in_minutes / 525600).round}年"
    end
  end
  
  
  def inline_tb_link link_text, inlineId, html = {}, tb = {}
    html_opts = {
      :title => '',
      :class => 'thickbox'
    }.merge!(html)
    tb_opts = {
      :height => 300,
      :width => 400,
      :inlineId => inlineId
    }.merge!(tb)
    
    path = '#TB_inline'.add_param(tb_opts)
    link_to(link_text, path, html_opts)
  end


  def look_options(selected)
      options_for_select([  
          ['任何人', 'anyone'],
          ['好友', 'friend'],
          ['不公开', 'no']],selected)
  end

  def show?(is_friend,is_show)
    if is_show == "no"
      return false
    end
    if is_show == "anyone"
      return true
    end
    if is_show == "friend"
      if is_friend != nil
      return true
      else
        return false
      end
    end
  end

    #是否在线
     def online?(id)
        online =  User.find(:first,:conditions => ['id = ? AND status <> ? AND updated_at > ?',id, 'offline', 25.minutes.ago])
       if online 
         return "showimg"
       else
         return "noimg"
       end
     end

  #显示googlemap
  def show_map(linemap,id)
    @m = "@map_#{id}"
    @m = GMap.new("#{@m}_div_id")
    @m.control_init(:large_map => true, :map_type => true)
    @m.center_zoom_init([linemap.lat,linemap.lng], 12)
    marker = GMarker.new([linemap.lat, linemap.lng],:title =>linemap.address, :info_window => linemap.description )
    @m.overlay_init(marker)
  end
end
