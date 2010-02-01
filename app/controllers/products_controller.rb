class ProductsController < ApplicationController
  def show
    @item = Product.find(:first, :conditions => ["permalink = ?", params[:id]], :include => :category)
  end
end
