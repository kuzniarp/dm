class Admin::ProducersController < ApplicationController
  layout 'admin'
  def index
    @items = Producer.all
  end

  def new
    @item = Producer.new
  end

  def create
    @item = Producer.create(params[:producer])
    redirect_to admin_producers_path
  end

  def edit
    @item = Producer.find_by_permalink(params[:id])
  end

  def update
    @item = Producer.find_by_permalink(params[:id])
    @item.update_attributes(params[:producer])
    redirect_to admin_producers_path
  end

  def destroy
    @item = Producer.find_by_permalink(params[:id])
    @item.destroy
    redirect_to admin_producers_path
  end
end
