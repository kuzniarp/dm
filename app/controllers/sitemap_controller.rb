class SitemapController < ApplicationController
	def sitemap
		@subpages = Subpage.find(:all, :order => 'page_order')
    @producers = Producer.all
    @products = Product.all
		headers["Content-Type"] = "text/xml"
		# set last modified header to the date of the latest entry.
		#headers["Last-Modified"] = @entries[0].updated_at.httpdate    
		render :layout => false
	end	
end
