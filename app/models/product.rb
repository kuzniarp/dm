class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :producer
  has_attached_file :image, :processors => [:watermark], :styles => {:thumb => "100>",
    :medium => { 
      :geometry => "300>", 
      :watermark_path => "#{RAILS_ROOT}/public/images/watermark.png",
      :position => "Center" }},
  :path => ":rails_root/public/system/:attachment/:class/:id/:style/:filename", 
  :url => "/system/:attachment/:class/:id/:style/:filename", :default_url => "/images/missing.png"
  has_permalink :name, :unique => true, :to_param => :permalink

  def includes_video?
    description.index('www.youtube.com/embed').present?
  end
end
