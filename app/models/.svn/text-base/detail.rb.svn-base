class Detail < ActiveRecord::Base
  #include FileColumn::Validations
  belongs_to :user
  file_column :photo, :magick => { 
             :versions => {
               #加上 :crop => "1:1" 是在图片中截取正方形图片
               :thumb => {:crop => "1:1", :geometry => "50x50"},
               :medium => {:crop => "1.5:1", :geometry => "200x133"},
               :large => {:geometry => "200x"},
              #变灰 :test1 => { :transformation => Proc.new { |image| image.quantize(256, Magick::GRAYColorspace) } }
              #模糊 :test2 => { :attributes => { :quality => 50 } }
             }
             }

#validates_file_format_of :photo, :in => ["gif", "png", "jpg"], :message => "你只能上传gif,png,jpg的图片文件。"
#validates_file_format_of :photo, :in => ["image/jpeg"], :message => "你只能上传gif,png,jpg的图片文件。"
#validates_filesize_of :photo, :in => 100..300.kilobytes,
#  :too_large_message => "最小尺寸100kb",
#  :too_small_message => "最小尺寸300kb"

end