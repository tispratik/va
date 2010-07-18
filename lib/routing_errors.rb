module RoutingErrors
  def self.included(controller)
    controller.send :rescue_from, ActiveRecord::RecordNotFound, :with => :record_not_found# if RAILS_ENV == 'production'
    controller.send :rescue_from, ActionController::RoutingError, :with => :record_not_found
    controller.send :rescue_from, ActionController::MethodNotAllowed, :with => :record_not_found
    controller.send :rescue_from, ActionController::UnknownAction, :with => :record_not_found
  end
  
  private
  
  def record_not_found
    flash[:notice] = "Sorry, the page you requested was not found."
    redirect_back
  end
  
  def redirect_back
    redirect_back_or_default(root_path)
  end
end
