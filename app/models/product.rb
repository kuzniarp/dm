class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :producer
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :path => ":rails_root/public/system/:attachment/:class/:id/:style/:filename", :url => "/system/:attachment/:class/:id/:style/:filename"
  has_permalink :name, :unique => true, :to_param => :permalink

end
