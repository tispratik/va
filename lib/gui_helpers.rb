module GuiHelpers
  
  def self.included(controller)
    controller.send :helper_method, :href_tag, :convert_month, :to_date, :to_date_time, :sort_order
  end

  private 
  
  def url_name(object, controller_name)
    return url_for(:controller => controller_name, :action => :show, :id => object.id)
  end
  
  def href_tag (the_url, display)
    return "<a href=\"" + the_url + "\">" + display + "</a>"
  end
  
  def sort_order(default) 
    # allows for more than one column to sort on 
    sql_order = [] 
    default_sort_order = "ascend_by"
    if (default.include?("ascend_by") || default.include?("descend_by"))
      default_sort_order = nil
    end
    
    sort_array = (params[:c] || default.to_s).gsub(/[\s;'\"]/,'').split(/,/) 
    sort_array.each do |c| 
      if default_sort_order.nil? && params[:sort].blank?
        sql_order << ".#{c}"
      else
        sql_order << ".#{params[:sort] || default_sort_order}_#{c}"
      end
      
    end 
    sql_order.join('.') 
  end
  
  def to_date_time(i)
    return i.blank? ? "" : (to_date(i) + " " + i.strftime("%I:%M%p"))
  end
  
  def to_date(i)
    return i.blank? ? "" : (i.strftime("%d").to_s + " " + convert_month(i.strftime("%B")) + ", " + i.strftime("%Y"))
  end
  
  def convert_month(month)
    month.slice(0..2) #Returns first 3 letters, eg) for "January" it returns "Jan"
  end
end
