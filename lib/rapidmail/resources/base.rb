require "forwardable"

module Rapidmail
  module Resources
    # Base class for all resource classes.
    class Base
      extend Forwardable

      attr_reader :client

      def_delegators :client, :get, :post, :patch, :put, :delete

      # Initializes a new resource instance.
      #
      # @param client [Rapidmail::Client] The client instance.
      def initialize(client)
        @client = client
      end

      # Finds a resource by ID.
      #
      # @param id [String] The ID of the resource.
      # @return [Faraday::Response] The response from the API.
      def find(id)
        get("#{resource_path}/#{id}")
      end

      private

      # Returns the resource path based on the class name.
      #
      # @return [String] The resource path.
      def resource_path
        self.class.name.split("::").last.downcase + "s"
      end
    end
  end
end
