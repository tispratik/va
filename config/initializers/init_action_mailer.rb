#ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.perform_deliveries = true
#ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.default_charset = 'utf-8'
#ActionMailer::Base.smtp_settings = {
#  :tls => true,
#  :enable_starttls_auto => true,
#  :address => APP_CONFIG[:smtp_address],
#  :port => APP_CONFIG[:smtp_port],
#  :domain => APP_CONFIG[:smtp_domain],
#  :authentication => :plain,
#  :user_name => APP_CONFIG[:smtp_username],
#  :password => APP_CONFIG[:smtp_password],
#  :default_content_type => "text/html"
#}