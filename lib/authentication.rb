module Authentication
  def self.included(controller)
    controller.send :before_filter, :set_current_user_in_model
    controller.send :helper_method, :current_user, :logged_in?, :redirect_to_target_or_default, :cu, :cid
    controller.send :after_filter, :store_target_location
    controller.filter_parameter_logging :password, :password_confirmation
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  private
  
  def cid
    return current_user.id
  end
  
  def cu
    return current_user
  end
  
  def logged_in?
    current_user
  end
  
  def login_required
    unless logged_in?
      unless controller_name == "users" && action_name == "me"
        flash[:error] = "You must first log in or sign up before accessing this page."
      end
      store_target_location
      redirect_to new_user_session_path
    end
  end
  
  def redirect_to_target_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  private
  
  def store_target_location
    if (request.request_uri <=> session[:return_to]) == 0
      session[:return_to] = request.request_uri
    end
  end
  
  def require_user
    unless current_user
      store_target_location
      flash[:notice] = "You must be logged in to access this page."
      redirect_to root_path
      return false
    end
  end
  
  def require_no_user
    if current_user
      store_target_location
      return false
    end
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end
  
  # stores parameters for current request
  def set_current_user_in_model
    if (!current_user.nil? && !@current_user.nil?)
      User.curr_user = current_user || @current_user
    end
  end
end
