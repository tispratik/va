class Pcproduct < ActiveRecord::Base
  
  has_one :pcsale, :as => :pcsaleable
  
end
