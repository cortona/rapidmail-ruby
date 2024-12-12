Rapidmail.configure do |config|
  config.username = ENV.fetch("RAPIDMAIL_USERNAME", nil)
  config.password = ENV.fetch("RAPIDMAIL_PASSWORD", nil)
end
