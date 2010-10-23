# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require File.expand_path(File.dirname(__FILE__) + '/blueprints')

[User].each(&:delete_all)

p "Making Users"
10.times do
    User.make
end

user = User.first
user.update_attributes(:username => "dummy", :password => "dummy", :password_confirmation => "dummy")