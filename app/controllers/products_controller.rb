class ProductsController < ApplicationController
  def show
    @item = Product.find(:first, :conditions => ["permalink = ?", params[:id]])
  end

  def set_meta_tag
    @meta_tag = MetaTag.new(:title => params[:id])
  end
end
