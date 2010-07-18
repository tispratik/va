class UsersController < ApplicationController
  
  before_filter :login_required
  
  def me
    @user = current_user
    render :edit
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "User details updated!"
    else
      flash[:notice] = @user.errors.full_messages.join('<br />')
    end
    redirect_to :back
  end
  
end