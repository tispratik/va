config.cache_classes = false
config.log_level = :debug
config.whiny_nils = true
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

config.action_mailer.raise_delivery_errors = false
config.gem 'machinist'
config.gem 'populator'
config.gem 'faker'
config.gem 'random_data'
#config.gem 'rails-footnotes'

config.after_initialize do
  ActiveMerchant::Billing::Base.mode = :test
  paypal_options = {
    :login => "seller_1229899173_biz_api1.railscasts.com",
    :password => "FXWU58S7KXFC6HBE",
    :signature => "AGjv6SW.mTiKxtkm6L9DcSUCUgePAUDQ3L-kTdszkPG8mRfjaRZDYtSu"
  }
  ::STANDARD_GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(paypal_options)
  ::EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)
end
