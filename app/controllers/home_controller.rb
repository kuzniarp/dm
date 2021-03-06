# -*- coding: utf-8 -*-
class HomeController < ApplicationController

	def index
		@homepage = Subpage.find_by_page_order(0) || Subpage.new
		@meta_tag = @homepage.meta_tag
		#order = RAILS_ENV == 'production' ? "rand()" : "random()"
		albums = Album.find(:all, :include => :photos, :conditions => "photos.album_id is not null", :order => "rand()", :limit => 3)
		#@photos = albums.map{|a| a.photos[rand(a.photos.size)]}
    #@contact = Subpage.find(:first, :order => "page_order desc") || Subpage.new
	end
	
	def show
		@page = Subpage.find(:first, :conditions => ["url_name = ?",params[:url_name]], :include => [:children, :producers])
		@meta_tag = @page.meta_tag if @page
    render :action => 'show_gallery' if @page.is_a?(Gallery)
	end

  def send_contact_form
    if verify_recaptcha && Mailer.deliver_contact_form(params[:sender], params[:title], params[:message], params[:phone])
      flash[:info] = "<span style=\"font-size:16px;\">Wiadomość została wysłana.</span>"
    else
      flash[:info] = "<span style=\"font-size:16px;color:red;font-weight:bold;\">Nie udało się wysłać wiadomości.</span><br />Upewnij się, że formularz jest wypełniony poprawnie i spróbuj jeszcze raz."
    end
    render :action => 'contact'
  end
end
