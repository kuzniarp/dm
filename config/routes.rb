ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end  
  # Sample resource route within a namespace:
  map.namespace :admin do |admin|
  # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
    admin.resources :products
    admin.resources :producers
    admin.resources :partners
    admin.resources :categories
  end

  #map.resources :products, :has_one => :category, :has_one => :producer    
  map.resources :producers
  map.resources :partners
  map.resources :products
  map.resources :categories	
  map.contact_form "/formularz_kontaktowy", :controller => "home", :action => "contact"
  map.send_contact_form "/send_contact_form", :controller => "home", :action => "send_contact_form"
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect 'sitemap.xml', :controller => "sitemap", :action => "sitemap" 
  map.connect '/', :controller => 'home', :action => 'index'
  map.connect '/admin', :controller => 'admin/subpage'
  map.connect '/admin/login', :controller => 'admin/home', :action => 'login'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.show_page '/:url_name', :controller => 'home', :action => 'show'
  map.show_album '/:subpage_url_name/:url_name', :controller => 'album', :action => 'show'
  map.show_photo '/:subpage_url_name/:album_url_name/:url_name', :controller => 'album', :action => 'show_photo'
end
