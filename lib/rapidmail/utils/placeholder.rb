require "yaml"

module Rapidmail
  module Utils
    # Lists placeholder values for email personalization
    class Placeholder
      # List of available placeholders for mailings
      #
      # @return [Array<String>] frozen array of placeholder names
      LIST = %w[
        email
        firstname
        lastname
        gender
        title
        zip
        birthdate
      ].freeze

      # Returns the list of available placeholders
      #
      # @return [Array<String>] frozen array of placeholder names
      # @example Get all available placeholders
      #   Rapidmail::Utils::Placeholder.list
      #   # => ["email", "firstname", "lastname", "gender", "title", "zip", "birthdate"]
      def self.list
        LIST
      end
    end
  end
end
