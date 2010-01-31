class Admin::CategoriesController < ApplicationController
  layout 'admin'
  def index
    @items = Category.all
  end

  def new
    @item = Category.new
  end

  def create
    @item = Category.create(params[:category])
    redirect_to admin_categories_path
  end

  def edit
    @item = Category.find_by_permalink(params[:id])
  end

  def update
    @item = Category.find_by_permalink(params[:id])
    @item.update_attributes(params[:category])
    redirect_to admin_categories_path
  end

  def destroy
    @item = Category.find_by_permalink(params[:id])
    @item.destroy
    redirect_to admin_categories_path
  end
end
