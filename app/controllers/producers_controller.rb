class ProducersController < ApplicationController
  def show
    conditions_string = ["producers.permalink = ?"]
    conditions_array = [params[:id]]
    unless params[:category].blank?
      conditions_string << "categories.id = ?"
      conditions_array << params[:category]
    end
    conditions = ([conditions_string.join(' AND ')] + conditions_array)
    @item = Producer.find(:first, :conditions => conditions, :include => {:products => :category})
    redirect_to root_path unless @item
  end
end
