module ApplicationHelper
   
  def profile_image (email, options = {})
    # url_for "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?s=50"
    url_for 'rails.png'
  end
  
  def url_name(object, controller_name)
    object.nil? ? "" : href_tag(url_only(object, controller_name), object.to_s)
  end
  
  def url_only(object, controller_name)
    return url_for(:controller => controller_name, :action => :show, :id => object.id) unless object.nil?
  end
  
  def show_flash_messages
    str = ""
    flash.each do |name, msg|
      str += <<-eos
      $("#flash_messages").html("#{escape_javascript(content_tag :div, flash.delete(name), :class => "flash #{name}")}");
      eos
    end
    str
  end
  
end