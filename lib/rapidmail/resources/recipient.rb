module Rapidmail
  module Resources
    # Resource class for managing recipients.
    class Recipient < Base
      # Lists all recipients with optional filters.
      #
      # @param params [Hash] Optional filters for listing recipients.
      # @return [Faraday::Response] The response from the API.
      def list(params = {})
        get(resource_path, params)
      end

      # Creates a new recipient.
      #
      # @param params [Hash] The parameters for creating a recipient.
      # @return [Faraday::Response] The response from the API.
      def create(params = {})
        post(resource_path, params)
      end

      # Deletes a recipient by ID.
      #
      # @param id [String] The ID of the recipient to delete.
      # @return [Faraday::Response] The response from the API.
      def destroy(id)
        delete("#{resource_path}/#{id}")
      end

      # Updates a recipient by ID.
      #
      # @param id [String] The ID of the recipient to update.
      # @param params [Hash] The parameters for updating the recipient.
      # @return [Faraday::Response] The response from the API.
      def update(id, params = {})
        patch("#{resource_path}/#{id}", params)
      end

      # Imports recipients.
      #
      # @return [Faraday::Response] The response from the API.
      def import
        post("#{resource_path}/import")
      end
    end
  end
end
