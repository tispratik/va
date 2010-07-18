class Omsitem < ActiveRecord::Base
  
  belongs_to :omsaccount
  belongs_to :pcsale
  
end
