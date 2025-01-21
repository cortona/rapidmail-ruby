require "faraday"
require "json"

module Rapidmail
  class Client
    API_BASE = "https://apiv3.emailsys.net".freeze
    TIMEOUT = 5

    def ping
      get("mailings")
      true
    rescue Faraday::ConnectionFailed
      false
    end

    def jobs
      @jobs ||= Resources::Job.new(self)
    end

    def mailings
      @mailings ||= Resources::Mailing.new(self)
    end

    def recipient_lists
      @recipient_lists ||= Resources::RecipientList.new(self)
    end

    def recipients
      @recipients ||= Resources::Recipient.new(self)
    end

    # Initializes a new client instance.
    #
    # @param username [String] The API username.
    # @param password [String] The API password.
    def initialize(username: Rapidmail.configuration.username, password: Rapidmail.configuration.password)
      @connection = build_connection(username, password)
    end

    # Sends a GET request.
    #
    # @param path [String] The API endpoint path.
    # @param params [Hash] The query parameters.
    # @return [Faraday::Response] The response from the API.
    def get(path, params = {})
      @connection.get(path, params)
    rescue Faraday::ConnectionFailed
      Rapidmail.online = false
      raise
    end

    # Sends a POST request.
    #
    # @param path [String] The API endpoint path.
    # @param params [Hash] The request body parameters.
    # @return [Faraday::Response] The response from the API.
    def post(path, params = {})
      @connection.post do |req|
        req.url path
        req.headers["Content-Type"] = "application/json"
        req.body = params.to_json
      end
    rescue Faraday::ConnectionFailed
      Rapidmail.online = false
      raise
    end

    # Sends a PATCH request.
    #
    # @param path [String] The API endpoint path.
    # @param params [Hash] The request body parameters.
    # @return [Faraday::Response] The response from the API.
    def patch(path, params = {})
      @connection.patch do |req|
        req.url path
        req.headers["Content-Type"] = "application/json"
        req.body = params.to_json
      end
    rescue Faraday::ConnectionFailed
      Rapidmail.online = false
      raise
    end

    # Sends a PUT request.
    #
    # @param path [String] The API endpoint path.
    # @param params [Hash] The request body parameters.
    # @return [Faraday::Response] The response from the API.
    def put(path, params = {})
      @connection.put do |req|
        req.url path
        req.headers["Content-Type"] = "application/json"
        req.body = params.to_json
      end
    rescue Faraday::ConnectionFailed
      Rapidmail.online = false
      raise
    end

    # Sends a DELETE request.
    #
    # @param path [String] The API endpoint path.
    # @return [Faraday::Response] The response from the API.
    def delete(path)
      @connection.delete(path)
    rescue Faraday::ConnectionFailed
      Rapidmail.online = false
      raise
    end

    private

    # Builds the Faraday connection.
    #
    # @param username [String] The API username.
    # @param password [String] The API password.
    # @return [Faraday::Connection] The Faraday connection.
    def build_connection(username, password)
      options = {
        request: {
          open_timeout: TIMEOUT,
          timeout: TIMEOUT
        },
        url: API_BASE,
        headers: {"Content-Type" => "application/json"}
      }

      Faraday.new(options) do |f|
        f.request :authorization, :basic, username, password
        f.response :logger
        f.response :json
        f.adapter Faraday.default_adapter
      end
    end
  end
end
