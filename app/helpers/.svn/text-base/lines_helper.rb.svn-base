module LinesHelper
  def airlinesname_options_for_select
      [ ['', ''], 
          ['中国国际航空公司(CA)', 'CA'],
          ['中国联合航空公司(KN)', 'KN'],
          ['中国南方航空(集团)公司(CZ)', 'CZ'],
          ['中国东方航空公司(MU)', 'MU'],
          ['海南航空公司(HU)', 'HU'],
          ['上海航空公司(FM)', 'FM'],
          ['深圳航空公司(ZH)', 'ZH'],
          ['大新华航空公司(CN)', 'CN'],
          ['大新华快运航空公司(GS)', 'GS'],
          ['奥凯航空公司(BK)', 'BK'],
          ['大新华航空公司(CN)', 'CN'],
          ['大新华快运航空公司(GS)', 'GS'],
          ['东北航空公司(NS)', 'NS'],
          ['东星航空公司(8C)', '8C'],
          ['华夏航空公司(G5)', 'G5'],
          ['吉祥航空公司(HO)', 'HO'],
          ['金鹿航空公司(JD)', 'JD'],
          ['鲲鹏航空有限公司(VD)', 'VD'],
          ['山东航空公司(SC)', 'SC'],
          ['四川航空公司(3U)', '3U'],
          ['西部航空公司(PN)', 'PN'],
          ['厦门航空有限公司(MF)', 'MF'],
          ['祥鹏航空公司(8L)', '8L'],
          ['鹰联航空公司(EU)', 'EU']]
    end


   def line_status_options_for_select
      options_for_select([  ['', ''],
          ['旅游', '旅游'],
          ['出差', '出差'],
          ['探亲访友', '探亲访友'],
        ['出国', '出国']])
    end

   def line_city_options_for_select
     options = City.find(:all).map do |c|
            [ c.name, c.name ]
        end
      options_for_select(options)
     end

   def line_airlinesname_options_for_select
      options_for_select([ ['', ''],
          ['中国国际航空公司(CA)', 'CA'],
          ['中国联合航空公司(KN)', 'KN'],
          ['中国南方航空(集团)公司(CZ)', 'CZ'],
          ['中国东方航空公司(MU)', 'MU'],
          ['海南航空公司(HU)', 'HU'],
          ['上海航空公司(FM)', 'FM'],
          ['深圳航空公司(ZH)', 'ZH'],
          ['大新华航空公司(CN)', 'CN'],
          ['大新华快运航空公司(GS)', 'GS'],
          ['奥凯航空公司(BK)', 'BK'],
          ['大新华航空公司(CN)', 'CN'],
          ['大新华快运航空公司(GS)', 'GS'],
          ['东北航空公司(NS)', 'NS'],
          ['东星航空公司(8C)', '8C'],
          ['华夏航空公司(G5)', 'G5'],
          ['吉祥航空公司(HO)', 'HO'],
          ['金鹿航空公司(JD)', 'JD'],
          ['鲲鹏航空有限公司(VD)', 'VD'],
          ['山东航空公司(SC)', 'SC'],
          ['四川航空公司(3U)', '3U'],
          ['西部航空公司(PN)', 'PN'],
          ['厦门航空有限公司(MF)', 'MF'],
          ['祥鹏航空公司(8L)', '8L'],
          ['鹰联航空公司(EU)', 'EU']])
    end
end