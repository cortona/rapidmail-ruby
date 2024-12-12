module Rapidmail
  module Resources
    class Recipient < Base
      def list(params = {})
        get(resource_path, params)
      end

      def create(params = {})
        post(resource_path, params)
      end

      def destroy(id)
        delete("#{resource_path}/#{id}")
      end

      def update(id, params = {})
        patch("#{resource_path}/#{id}", params)
      end

      def import
        post("#{resource_path}/import")
      end
    end
  end
end
