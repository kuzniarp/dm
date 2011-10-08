class Category < ActiveRecord::Base
  has_many :products, :order => :producer_id

  has_permalink :name, :unique => true
end

class String 
  def to_permalink 
    str = UnicodeNormalizer.normalize(self)
    str = ActiveSupport::Multibyte::Chars.new(str)
    str = str.normalize(:kd).gsub(/[^\x00-\x7F]/,'').to_s
    str.gsub!(/[^-\w\d]+/sim, "-")
    str.gsub!(/-+/sm, "-")
    str.gsub!(/^-?(.*?)-?$/, '\1')
    str.downcase!
    str
  end
end
