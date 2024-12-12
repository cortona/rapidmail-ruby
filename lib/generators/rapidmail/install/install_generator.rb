module Rapidmail
  module Generators
    # Generator class for installing the Rapidmail initializer.
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      # Copies the initializer template to the application's initializer directory.
      def copy_initializer
        template "initializer.rb", "config/initializers/rapidmail.rb"
      end
    end
  end
end
