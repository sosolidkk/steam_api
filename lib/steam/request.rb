module Steam
  class Request
    def initialize(request_struct:, response_struct:, client:)
      @failure_handler = Steam::FailureHandler.instance
      @request_struct = request_struct
      @response_struct = response_struct
      @client = client

      build_request
    end

    def run
      freeze

      raw_response = @raw_request.run

      Response.new(raw_response: raw_response, response_struct: response_struct, request: self).tap do |response|
        failure_handler.call(response)
      end
    end

    private

    def build_request
      @raw_request = ::Typhoeus::Request.new(url, build_options)
    end

    def url
      <<~URL.squish
        #{client.base_endpoint}
        #{request_struct.interface}
        #{request_struct.path}
        #{request_struct.version}
      URL
    end

    def build_options
      {
        method: request_struct.method,
        headers: default_headers,
        body: request_struct.body.to_json
      }
    end

    def default_headers
      {'Content-Type' => 'application/json'}
    end
  end
end
