class Ucontact < ActiveRecord::Base
  
  establish_connection "op_#{RAILS_ENV}"
  
  OP_PHONE_TYPES = Decode.find_all_by_name("OP_Phone_Type")
  belongs_to :user
  belongs_to :country
end