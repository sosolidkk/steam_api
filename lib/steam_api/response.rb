require "forwardable"

module SteamApi
  # Wraps the raw response received from the Api
  class Response
    extend Forwardable

    def_delegators :@raw_response, :timed_out?, :success?, :body
    attr_accessor :request

    # Initialize a new instance
    # @param [Typhoeus::Response] raw_response
    # @param [SteamApi::Structs::Base] response_struct The struct necessary to
    #   build the response received from Api
    # @param [SteamApi::Request] request The wrapper Request class
    def initialize(raw_response:, response_struct:, request:)
      @raw_response = raw_response
      @response_struct = response_struct
      @request = request
    end

    # Check if the request was successful or not
    # @return [Boolean]
    def fail?
      !success?
    end

    # Returns the HTTP status code
    # @return [Integer]
    def status_code
      raw_response.code
    end

    # Parses the response's json body as a Hash. If the response body isn't a json
    # returns an empty hash
    # @return [Hash]
    def to_h
      ::JSON.parse(raw_response.body.to_s).deep_symbolize_keys
    rescue JSON::ParserError
      {}
    end

    # Parses the response's json body and build the expected struct
    # @return [SteamApi::Structs::Base]
    def result
      response_struct.build_from_response(to_h)
    end

    private

    attr_accessor :raw_response, :response_struct
  end
end
