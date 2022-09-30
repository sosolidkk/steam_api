module Steam
  # Class that checks an Api response and raise the correct exception
  class FailureHandler
    include Singleton

    # Perform the check
    # @param [Steam::Response] the response received from the Api
    # @return [NilClass] if response was successful
    # @raise [Steam::Errors::ApiError] if response was a failure.
    def call(response)
      return unless response.fail?

      raise_response_4xx(response) if (400..499).cover?(response.status_code)
      raise_response_5xx(response) if (500..599).cover?(response.status_code)
    end

    private

    def raise_response_4xx(response)
      case response.status_code
      when 400 then raise Steam::Errors::HttpBadRequest, response
      when 401 then raise Steam::Errors::HttpUnauthorized, response
      when 403 then raise Steam::Errors::HttpForbidden, response
      when 404 then raise Steam::Errors::HttpNotFound, response
      end
    end

    def raise_response_5xx(response)
      case response.status_code
      when 500 then raise Steam::Errors::HttpInternalServerError, response
      end
    end
  end
end
