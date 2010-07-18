class Pcsale < ActiveRecord::Base
  
  belongs_to :pcsaleable, :polymorphic => true
  
end
