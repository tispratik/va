class ApplicationController < ActionController::Base

  include Authentication
  include GuiHelpers
  include RoutingErrors
  #include ExceptionNotifiable
  
  layout proc{ |c| c.request.xhr? ? false : "application" }
  
  helper :all  
  protect_from_forgery
  before_filter :set_user_time_zone, :remove_param
  
  private
  
  def set_user_time_zone
    Time.zone = current_user.ucontact.time_zone if (current_user && current_user.ucontact)
  end
  
  def remove_param
    params.delete_if {|key, value| value == "ANY" }
  end
  
  def ssl_supported?
    (ENV['RAILS_ENV'] == 'production')
  end
  
  def ssl_required
    if !request.ssl? && ssl_supported?
      redirect_to :protocol => "https"
      flash.keep
      return false
    end
  end

  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end
  

end
