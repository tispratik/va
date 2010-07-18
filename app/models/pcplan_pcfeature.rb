class PcplanPcfeature < ActiveRecord::Base
  
  belongs_to :pcplan_sale, :class_name => 'PcSale', :foreign_key => "pcplan_saleid"
  belongs_to :pcfeature
  
end
