class Pcusage < ActiveRecord::Base
  
  belongs_to :pcfeature
  belongs_to :country
  
end
