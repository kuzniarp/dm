class ProducersController < ApplicationController
  def show
    @producer = Producer.find(:first, :conditions => ["permalink = ?", params[:id]], :include => {:products => :category})
    conditions_string = []
    conditions_array = []
    unless params[:category_id].blank?
      conditions_string << "categories.id = ?"
      conditions_array << params[:category_id]
    end
    conditions = ([conditions_string.join(' AND ')] + conditions_array)
    @products = @producer.products.all(:conditions => conditions, :include => [:producer, :category])
  end

  def set_meta_tag
    @meta_tag = MetaTag.new(:title => params[:id])
  end
end
