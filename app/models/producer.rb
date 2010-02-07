class Producer < ActiveRecord::Base
  has_many :products
  belongs_to :subpage
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :path => ":rails_root/public/system/:attachment/:class/:id/:style/:filename", :url => "/system/:attachment/:class/:id/:style/:filename"
  has_permalink :name, :unique => true, :to_param => :permalink
  has_many :categories, :through => :products
end
