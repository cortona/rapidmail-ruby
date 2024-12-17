require "yaml"

module Rapidmail
  module Utils
    # Utility class for loading Rapidmail configuration from YAML files
    class ConfigLoader
      # Loads configuration from a YAML file and configures Rapidmail
      #
      # @param file_path [String] path to the YAML configuration file
      # @return [void]
      # @raise [Rapidmail::Error] if required configuration keys are missing
      #
      # @example Loading configuration from a YAML file
      #   # config.yml:
      #   # username: your_username
      #   # password: your_password
      #
      #   Rapidmail::Utils::ConfigLoader.load('config.yml')
      #   # => "Configuration loaded from config.yml"
      #
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
