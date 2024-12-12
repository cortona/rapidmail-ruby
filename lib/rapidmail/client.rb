require "faraday"
require "json"

module Rapidmail
  class Client
    API_BASE = "https://apiv3.emailsys.net".freeze
    TIMEOUT = 5

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

    def initialize(username: Rapidmail.configuration.username, password: Rapidmail.configuration.password)
      @connection = build_connection(username, password)
    end

    def get(path, params = {})
      # @connection.get(path, params)
      @connection.get do |req|
        req.url path
        req.headers["Content-Type"] = "application/json"
      end
    end

    def post(path, params = {})
      @connection.post do |req|
        req.url path
        req.headers["Content-Type"] = "application/json"
        req.body = params.to_json
      end
    end

    def patch(path, params = {})
      @connection.patch do |req|
        req.url path
        req.headers["Content-Type"] = "application/json"
        req.body = params.to_json
      end
    end

    def put(path, params = {})
      @connection.put do |req|
        req.url path
        req.headers["Content-Type"] = "application/json"
        req.body = params.to_json
      end
    end

    def delete(path)
      @connection.delete(path)
    end

    private

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
