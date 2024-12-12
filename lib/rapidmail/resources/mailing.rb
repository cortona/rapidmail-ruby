module Rapidmail
  module Resources
    # Resource class for managing mailings.
    class Mailing < Base
      # Lists all mailings with optional filters.
      #
      # @param params [Hash] Optional filters for listing mailings.
      # @return [Faraday::Response] The response from the API.
      def list(params = {})
        get(resource_path, params)
      end

      # Creates a new mailing.
      #
      # @param params [Hash] The parameters for creating a mailing.
      # @return [Faraday::Response] The response from the API.
      def create(params = {})
        post(resource_path, params)
      end

      # Deletes a mailing by ID.
      #
      # @param id [String] The ID of the mailing to delete.
      # @return [Faraday::Response] The response from the API.
      def destroy(id)
        delete("#{resource_path}/#{id}")
      end

      # Pauses a mailing by ID.
      #
      # @param id [String] The ID of the mailing to pause.
      # @return [Faraday::Response] The response from the API.
      def pause(id)
        post("#{resource_path}/#{id}/pause")
      end

      # Cancels a mailing by ID.
      #
      # @param id [String] The ID of the mailing to cancel.
      # @return [Faraday::Response] The response from the API.
      def cancel(id)
        post("#{resource_path}/#{id}/cancel")
      end

      # Retrieves the stats for a mailing by ID.
      #
      # @param id [String] The ID of the mailing.
      # @return [Faraday::Response] The response from the API.
      def stats(id)
        get("#{resource_path}/#{id}/stats")
      end

      # Anonymizes the stats for a mailing by ID.
      #
      # @param id [String] The ID of the mailing.
      # @return [Faraday::Response] The response from the API.
      def anonymize(id)
        put("#{resource_path}/#{id}/stats/anonymize")
      end

      # Retrieves the activity stats for a mailing by ID.
      #
      # @param id [String] The ID of the mailing.
      # @return [Faraday::Response] The response from the API.
      def activity(id)
        get("#{resource_path}/#{id}/stats/activity")
      end

      # Retrieves the activity stats for a specific recipient in a mailing by IDs.
      #
      # @param id [String] The ID of the mailing.
      # @param recipient_id [String] The ID of the recipient.
      # @return [Faraday::Response] The response from the API.
      def recipient_activity(id, recipient_id)
        get("#{resource_path}/#{id}/stats/activity/#{recipient_id}")
      end
    end
  end
end
