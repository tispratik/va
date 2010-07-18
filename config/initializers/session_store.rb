# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_VA_session',
  :secret      => 'f37bf0ec467fe9b8c30ec5f95b4ba88590c7fc9f5af0cdbefa7e1dd0309f2da9b79ec2ca2689fcc1abf9c9c10923b6ccdad5e6ea566b85d21b02175a3f84f78e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
