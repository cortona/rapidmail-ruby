# frozen_string_literal: true

require "rapidmail/client"
require "rapidmail/configuration"
require "rapidmail/version"

require "rapidmail/resources/base"
require "rapidmail/resources/job"
require "rapidmail/resources/mailing"
require "rapidmail/resources/recipient_list"
require "rapidmail/resources/recipient"

require "rapidmail/utils/config_loader"
require "rapidmail/utils/placeholder"
require "rapidmail/utils/zip_encoder"

module Rapidmail
  class Error < StandardError; end

  class << self
    # Returns a new client instance.
    #
    # @return [Rapidmail::Client] The client instance.
    def client(...)
      Client.new(...)
    end

    # Forwards missing methods to the client instance.
    def method_missing(method, *args, &block)
      return super unless client.respond_to?(method)
      client.send(method, *args, &block)
    end

    # Checks if the client instance responds to a missing method.
    def respond_to_missing?(method, include_all = false)
      client.respond_to?(method, include_all) || super
    end

    # Returns the configuration instance.
    #
    # @return [Rapidmail::Configuration] The configuration instance.
    def configuration
      @configuration ||= Configuration.new
    end

    # Yields the configuration instance for configuration.
    def configure
      yield(configuration)
    end

    # Returns or sets the connection status to the Rapidmail service.
    # Defaults to online == true.
    # If status is false, attempts to reconnect via ping.
    #
    # @return [Boolean] Current connection status
    def online?
      @online = true if @online.nil?
      @online = client.ping if @online == false
      @online
    end

    # Updates the connection status to the Rapidmail service.
    # Set to false when connection fails, true when connection succeeds.
    #
    # @param status [Boolean] new connection status
    attr_writer :online
  end
end
