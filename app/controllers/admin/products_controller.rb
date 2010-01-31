class Admin::ProductsController < ApplicationController
  layout 'admin'
  def index
    @items = Product.all
  end

  def new
    @item = Product.new
  end

  def create
    @item = Product.create(params[:product])
    redirect_to admin_products_path
  end

  def edit
    @item = Product.find_by_permalink(params[:id])
  end

  def update
    @item = Product.find_by_permalink(params[:id])
    @item.update_attributes(params[:product])
    redirect_to admin_products_path
  end

  def destroy
    @item = Product.find_by_permalink(params[:id])
    @item.destroy
    redirect_to admin_products_path
  end
end
