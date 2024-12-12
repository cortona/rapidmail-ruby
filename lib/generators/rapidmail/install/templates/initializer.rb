# This is the initializer for configuring the Rapidmail client.
# Set your Rapidmail username and password using environment variables.

Rapidmail.configure do |config|
  config.username = ENV.fetch("RAPIDMAIL_USERNAME", nil)
  config.password = ENV.fetch("RAPIDMAIL_PASSWORD", nil)
end
