class Producer < ActiveRecord::Base
  has_many :products
  belongs_to :subpage

  has_permalink :name

  def to_param
    self.permalink
  end
end
