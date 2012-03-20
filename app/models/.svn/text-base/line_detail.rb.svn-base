class LineDetail < ActiveRecord::Base
  belongs_to :user
  has_many :line_users
  has_many :line_maps
  has_many :line_places
  has_many :line_notes
  has_many :line_articles
  has_many :line_contents
  validates_presence_of     :title,  :message => "行程名称不能为空"
  validates_presence_of     :endcity,  :message => "主要目的地不能为空"
  validates_presence_of     :status,  :message => "目的不能为空"
  validates_presence_of     :startdate,  :message => "出发时间不能为空"
  validates_presence_of     :enddate,  :message => "结束时间不能为空"

  after_create :create_users_and_place
  
  def self.per_page()
    15
  end

  def n
    "#{airlinesname}#{number}"
  end

  #在创建完line_details后创建line_places和line_users表
  def create_users_and_place
    #创建line_users
    @lineuser = LineUser.new()
    @lineuser.line_id =  self.id
    @lineuser.user_id = self.user_id
    @lineuser.status = 'admin'
    @lineuser.save
    #创建line_places
    #先算出一共有几天，在把时间以“2090－8－13”的格式记录到date字段
    (Date.parse(self.startdate.strftime("%Y-%m-%d"))..Date.parse(self.enddate.strftime("%Y-%m-%d"))).each do |date|
      @lineplace = LinePlace.new()
      @lineplace.line_id = self.id
      @lineplace.place = self.endcity
      @lineplace.date = date
      @lineplace.save
    end
  end
  
   protected
         def validate
           if startcity == "选择城市"
             errors.add("出发地", "出发地不能为空")
           end
#           if endcity == "选择城市"
#             errors.add("目的地", "目的地不能为空")
#           end
           if startdate != nil && enddate != nil
             if startdate > enddate
               errors.add("时间", "出发时间不能比到达时间晚")
             end
           end
#           if airlinesname == nil || airlinesname.empty?
#             errors.add("请选择", "请选择航空公司")
#           end
         end
end
