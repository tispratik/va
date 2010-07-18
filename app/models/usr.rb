class Usr < ActiveRecord::Base
  establish_connection "op_#{RAILS_ENV}"
  belongs_to :user
  
  validates_presence_of :first_name, :last_name
  
end