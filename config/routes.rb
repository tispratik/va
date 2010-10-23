Va::Application.routes.draw do

  # registration and login
  resource :registration, :only => [:new, :create, :edit, :update, :password, :destroy], :as => :users,
      :path_names => {:new => :sign_up}, :member => {:validate => :post}, :collection => {:regions => :get, :cities => :get}
  
      #with_options(:controller => 'user_sessions', :name_prefix => nil) do |session|
    #session.new_user_session     "sign_in",  :action => :new, :conditions => {:method => :get}
    #session.user_session         "sign_in",  :action => :create, :conditions => {:method => :post}
    #session.destroy_user_session "sign_out", :action => :destroy, :conditions => {:method => :get}
    #end
  
  scope 'session' do
    get 'sign_in' => 'user_sessions#new', :as => :new_user_session
    post 'sign_in' => 'user_sessions#create', :as => :user_session
    get 'sign_out' => 'user_sessions#destroy', :as => :destroy_user_session
  end
  
  resources :users
  #connect "live_validations/:action", :controller => "live_validations"
  match "live_validations/:action", :to => 'live_validations'
  #root :controller => :users, :action => :me
  root :to => 'users#me'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
