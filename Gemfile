source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem 'mysql'
#gem 'geoip' --> Broken with Rails3
gem 'authlogic'
gem 'haml'
gem 'email_veracity'
gem "activemerchant"
gem 'formtastic'
#gem 'live_validations' --> Not found in Rails3
#gem 'name_nanny' --> Not found in Rails3
gem 'constant_cache'
  
# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

group :development, :test do
  gem 'machinist'
  gem 'populator'
  gem 'faker'
  #gem 'random_data' --> Seems to be broken
  #gem 'rails-footnotes' --> Seems to be broken
end

gem "exception_notification", :git => "git://github.com/rails/exception_notification", :require => 'exception_notifier'
