# frozen_string_literal: true

require "rapidmail/client"
require "rapidmail/configuration"
require "rapidmail/version"

require "rapidmail/resources/base"
require "rapidmail/resources/job"
require "rapidmail/resources/mailing"
require "rapidmail/resources/recipient_list"
require "rapidmail/resources/recipient"

require "rapidmail/utils/zip_encoder"
require "rapidmail/utils/config_loader"

module Rapidmail
  class Error < StandardError; end

  class << self
    def client(...)
      Client.new(...)
    end

    def method_missing(method, *args, &block)
      return super unless client.respond_to?(method)
      client.send(method, *args, &block)
    end

    def respond_to_missing?(method, include_all = false)
      client.respond_to?(method, include_all) || super
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
