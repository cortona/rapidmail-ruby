module Rapidmail
  module Resources
    class Mailing < Base
      def list(params = {})
        get(resource_path, params)
      end

      def create(params = {})
        post(resource_path, params)
      end

      def destroy(id)
        delete("#{resource_path}/#{id}")
      end

      def pause(id)
        post("#{resource_path}/#{id}/pause")
      end

      def cancel(id)
        post("#{resource_path}/#{id}/cancel")
      end

      # MailingStats
      def stats(id)
        get("#{resource_path}/#{id}/stats")
      end

      # MailingStatsAnonymize
      def anonymize(id)
        put("#{resource_path}/#{id}/stats/anonymize")
      end

      # MailingRecipients
      def activity(id)
        get("#{resource_path}/#{id}/stats/activity")
      end

      def recipient_activity(id, recipient_id)
        get("#{resource_path}/#{id}/stats/activity/#{recipient_id}")
      end
    end
  end
end
