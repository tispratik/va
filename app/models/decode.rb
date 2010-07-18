#To cache the decodes table data
require 'constant_cache'  

class Decode < ActiveRecord::Base

  establish_connection :ref_area
  
  default_scope :order => :sort_order
  
  #The key that will be used to retrieve constants is the constant_value
  caches_constants :key => :constant_value
  
  #association creator
  belongs_to :creator, :class_name => 'User', :foreign_key => "created_by"
  
  #association updator
  belongs_to :updator, :class_name => 'User', :foreign_key => "updated_by"
  
  ANY = "ANY"
  
  def self.all_values_by_decode_name(decode_name)
    Decode.find_all_by_name(decode_name).map(&:id)
  end
  
  #Used by formtastic for dropdowns
  def to_label
    display_value
  end
end
