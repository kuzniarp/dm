class Producer < ActiveRecord::Base
  has_many :products
  belongs_to :subpage

  has_permalink :name, :unique => true, :to_param => :permalink
end
