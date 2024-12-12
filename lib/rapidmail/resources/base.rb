require "forwardable"

module Rapidmail
  module Resources
    class Base
      extend Forwardable

      attr_reader :client

      def_delegators :client, :get, :post, :patch, :put, :delete

      def initialize(client)
        @client = client
      end

      def find(id)
        get("#{resource_path}/#{id}")
      end

      private

      def resource_path
        self.class.name.split("::").last.downcase + "s"
      end
    end
  end
end
