require "zip"
require "base64"

module Rapidmail
  module Utils
    # Utility class for encoding files into a zip archive and then Base64 encoding the result.
    class ZipEncoder
      # Encodes the given files into a zip archive and then Base64 encodes the result.
      #
      # @param files [Hash] A hash where the keys are filenames and the values are file contents.
      # @return [String] The Base64 encoded string of the zip archive.
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
