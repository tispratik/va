class Region < ActiveRecord::Base
  
  establish_connection :ref_area
  
  default_scope :order => :name
  belongs_to :country
  has_many :cities
  
end
