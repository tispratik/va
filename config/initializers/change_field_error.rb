#When an error occurs, the error message adds a div tag, which disturbes the allignment of the pages.
#Thruough this setting we're replacing the div with span
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  "<span class='field_error'>#{html_tag}</span>"
end