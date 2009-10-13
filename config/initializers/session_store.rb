# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_postgis_example_session',
  :secret      => '1fac5bb8ec9862592e6da5e352602f6373c0bbd47564deee7bfd9d45e810b557bf61050c2a1e3eca8815bee41c1683503d1e19c74511a56c345d0102452d5392'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
