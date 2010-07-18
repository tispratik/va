require 'GeoIP'
class RegistrationsController < ApplicationController

  skip_before_filter :login_required, :except => [:edit, :update]
  
  def new
    @user = User.new(:ucontact => Ucontact.new, :usr => Usr.new)
  end
  
  def create
    @user = User.new(params[:user])
    @user.valid?
    if @user.errors.empty?
      @user.save
      ip='24.171.23.184' #request.env['REMOTE_ADDR']
      geoipobj = GeoIP.new("C://rubyonrails//rails_apps//va//private//geoip//geolitecity.dat").country(ip)
      if geoipobj != nil
        u = Ucontact.new
        u.user_id = @user.id
        u.latitude = geoipobj[9]
        u.longitude = geoipobj[10]
        u.country = Country.first(:conditions => { :iso3 => geoipobj[3] }).ison
        u.state = geoipobj[2] + "." + geoipobj[6]
        u.city = geoipobj[7]
        u.zip = geoipobj[8]
        u.save
      end
      flash[:notice] = "Account registered!"
      redirect_to_target_or_default @user
    else
      render :action => :new
    end
  end
  
  def validate
    @user = User.new(params[:user])
    @user.valid?
    errors = {}
    @user.errors.each do |attr, msg|
      errors[attr] = msg
    end
    render :text => errors.to_json
  end
  
  def regions
    @regions = Region.all(:conditions => {:country_id => params[:country_id]})
    render :layout => false
  end
  
  def cities
    @cities = City.all(:conditions => {:region_id => params[:region_id]})
    render :layout => false
  end
  
  
  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to user_path(@user)
    else
      render :action => :edit
    end
  end
  
end