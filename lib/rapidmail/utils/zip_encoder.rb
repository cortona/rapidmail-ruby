require "zip"
require "base64"

module Rapidmail
  module Utils
    class ZipEncoder
      def self.encode(files)
        zip_data = Zip::OutputStream.write_buffer do |zip|
          files.each do |filename, content|
            zip.put_next_entry(filename)
            zip.write content
          end
        end

        Base64.strict_encode64(zip_data.string)
      end
    end
  end
end
