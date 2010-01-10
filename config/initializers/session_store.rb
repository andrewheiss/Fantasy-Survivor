# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Fantasy-Survivor_session',
  :secret      => '1362f0ad73ad785551e50aab63eac94c218a0b332b2404a834e45c23e605ea15fcaaf84a5f234e0088261ad33198314ebadf8f991a71c9ed795f8f1ebd1427be'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
