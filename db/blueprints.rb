require 'machinist/active_record'
require 'random_data'
require 'faker'

User.blueprint do
  username              { Faker::Name.first_name }
  login_email           { Random.email }
  password              { "dummy" }
  password_confirmation { "dummy" }
  is_email_verified     { Random.boolean }
end