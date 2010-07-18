class Pcplan < ActiveRecord::Base
  
  belongs_to :pcproduct_sale, :class_name => 'PcSale', :foreign_key => "pcproduct_saleid"
  
end
