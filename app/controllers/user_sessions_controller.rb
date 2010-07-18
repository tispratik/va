class UserSessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Logged in successfully."
      #Resetting the session to avoid session fixation attacks. This session cannot be reused. Authlogic does not do it.
      reset_session
      redirect_to_target_or_default(root_url)
    else
      flash[:notice] = "Failed to login! Email and Password do not match."
      render :action => 'new'
    end
  end
  
  def destroy
    if !current_user_session.nil?
      current_user_session.destroy
      flash[:notice] = "Logout successful!"
      @current_user = false
      #Resetting the session to avoid session fixation attacks. This session cannot be reused. Authlogic does not do it.
      reset_session
    end
    redirect_to root_path
  end
  
end