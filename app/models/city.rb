class City < ActiveRecord::Base
  
  establish_connection :ref_area

  default_scope :order => :name
  belongs_to :country
  belongs_to :region
  
end
