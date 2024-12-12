require "yaml"

module Rapidmail
  module Utils
    class ConfigLoader
      def self.load(file_path)
        config = YAML.load_file(file_path)
        raise Rapidmail::Error, "Missing 'username' in configuration file" unless config.key?("username")
        raise Rapidmail::Error, "Missing 'password' in configuration file" unless config.key?("password")

        Rapidmail.configure do |c|
          c.username = config["username"]
          c.password = config["password"]
        end

        puts "Configuration loaded from #{file_path}"
      rescue Rapidmail::Error => e
        puts "Warning: Failed to load configuration: #{e.message}"
      end
    end
  end
end
