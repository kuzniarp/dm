class Admin::PartnersController < ApplicationController
  layout 'admin'
  def index
    @items = Partner.all
  end

  def new
    @item = Partner.new
  end

  def create
    @item = Partner.create(params[:partner])
    redirect_to admin_partners_path
  end

  def edit
    @item = Partner.find_by_permalink(params[:id])
  end

  def update
    @item = Partner.find_by_permalink(params[:id])
    @item.update_attributes(params[:partner])
    redirect_to admin_partners_path
  end

  def destroy
    @item = Partner.find_by_permalink(params[:id])
    @item.destroy
    redirect_to admin_partners_path
  end
end
