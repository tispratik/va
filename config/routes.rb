ActionController::Routing::Routes.draw do |map|

  map.current_cart 'cart', :controller => 'carts', :action => 'show', :id => 'current'

  map.resources :orders, :new => { :express => :get }
  map.resources :line_items
  map.resources :carts
  map.resources :products
  map.resources :categories

  map.root :products
  
  # registration and login
  map.resource :registration, :only => [:new, :create, :edit, :update, :password, :destroy], :as => :users,
      :path_names => {:new => :sign_up}, :member => {:validate => :post}, :collection => {:regions => :get, :cities => :get}
  
  map.with_options(:controller => 'user_sessions', :name_prefix => nil) do |session|
    session.new_user_session     "sign_in",  :action => :new, :conditions => {:method => :get}
    session.user_session         "sign_in",  :action => :create, :conditions => {:method => :post}
    session.destroy_user_session "sign_out", :action => :destroy, :conditions => {:method => :get}
  end
  
  map.resources :users
  map.connect "live_validations/:action", :controller => "live_validations"
  #map.root :controller => :users, :action => :me
  
end