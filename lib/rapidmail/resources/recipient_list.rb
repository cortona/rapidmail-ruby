module Rapidmail
  module Resources
    # Resource class for managing recipient lists.
    class RecipientList < Base
      # Lists all recipient lists with optional filters.
      #
      # @param params [Hash] Optional filters for listing recipient lists.
      # @return [Faraday::Response] The response from the API.
      def list(params = {})
        get(resource_path, params)
      end

      # Creates a new recipient list.
      #
      # @param params [Hash] The parameters for creating a recipient list.
      # @return [Faraday::Response] The response from the API.
      def create(params = {})
        post(resource_path, params)
      end

      # Deletes a recipient list by ID.
      #
      # @param id [String] The ID of the recipient list to delete.
      # @return [Faraday::Response] The response from the API.
      def destroy(id)
        delete("#{resource_path}/#{id}")
      end

      # Updates a recipient list by ID.
      #
      # @param id [String] The ID of the recipient list to update.
      # @param params [Hash] The parameters for updating the recipient list.
      # @return [Faraday::Response] The response from the API.
      def update(id, params = {})
        patch("#{resource_path}/#{id}", params)
      end

      # Retrieves the activity stats for a recipient list by ID.
      #
      # @param id [String] The ID of the recipient list.
      # @return [Faraday::Response] The response from the API.
      def activity(id)
        get("#{resource_path}/#{id}/stats/activity")
      end
    end
  end
end
