module SteamApi
  # Class that checks an Api response and raise the correct exception
  class FailureHandler
    include Singleton

    # Perform the check
    # @param [SteamApi::Response] the response received from the Api
    # @return [NilClass] if response was successful
    # @raise [SteamApi::Errors::ApiError] if response was a failure.
    def call(response)
      return unless response.fail?

      raise_timedout(response) if response.timed_out?

      raise_response_4xx(response) if (400..499).cover?(response.status_code)
      raise_response_5xx(response) if (500..599).cover?(response.status_code)

      raise_api_error(response)
    end

    private

    def raise_timedout(response)
      raise SteamApi::Errors::HttpTimeout, response
    end

    def raise_response_4xx(response)
      case response.status_code
      when 400 then raise SteamApi::Errors::HttpBadRequest, response
      when 401 then raise SteamApi::Errors::HttpUnauthorized, response
      when 403 then raise SteamApi::Errors::HttpForbidden, response
      when 404 then raise SteamApi::Errors::HttpNotFound, response
      end
    end

    def raise_response_5xx(response)
      case response.status_code
      when 500 then raise SteamApi::Errors::HttpInternalServerError, response
      end
    end

    def raise_api_error(response)
      raise SteamApi::Errors::ApiError, response
    end
  end
end
