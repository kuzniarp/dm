class CategoriesController < ApplicationController
  def show
    @category = Category.find_by_permalink(params[:id])
  end

  def set_meta_tag
    @meta_tag = MetaTag.new(:title => params[:id])
  end
end
