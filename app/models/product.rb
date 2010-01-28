class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :producer
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
