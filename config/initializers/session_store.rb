# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bau_session',
  :secret      => 'c10200b0aa661b624011690f8f35d56ec93c9c36bb24efe8a0136319bce31d7227f0b10d656df16ceb57c2706315348323b8b1797f6fd1a83188af0b36f3d175'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
