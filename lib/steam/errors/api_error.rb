module Steam
  module Errors
    # Error class that wraps an Api request failed
    #
    class ApiError < ::StandardError
      # Initializes a request API custom error
      # @param [Steam::Response] Http response wrapper
      # @return A new instance of ApiError
      #
      def initialize(response)
        @http_status_code = response.status_code
        @response = response
        @request = response.request

        super(build_description_message)
      end

      private

      attr_accessor :http_status_code, :response

      def build_description_message
        <<~MESSAGE.squish
          A request failed with the following response code (HTTP #{http_status_code})
          and response body: #{response.body}
        MESSAGE
      end
    end

    class HttpBadRequest < ApiError; end
    class HttpUnauthorized < ApiError; end
    class HttpNotFound < ApiError; end
    class HttpInternalServerError < ApiError; end
  end
end
