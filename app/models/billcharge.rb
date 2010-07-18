class Billcharge < ActiveRecord::Base
  
  belongs_to :bill
  belongs_to :omsaccount
  belongs_to :omsitem
  
end
