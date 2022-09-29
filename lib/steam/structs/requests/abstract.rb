module Steam
  module Structs
    module Requests
      # @abstract class for a Request's struct
      class Abstract < Steam::Structs::Base
        # Returns the version value to create the request path
        # @abstract
        # @return [String] the version of the request path
        def version
          raise NotImplementedError, 'Override this method'
        end

        # Returns the interface value to create the request path
        # @abstract
        # @return [String] the interface of the request path
        def interface
          raise NotImplementedError, 'Override this method'
        end

        # Returns the API path value to create the request path
        # @abstract
        # @return [String] the API path of the request path
        def path
          raise NotImplementedError, 'Override this method'
        end

        # Returns the HTTP method used by the request.
        # @return [Symbol]
        def method
          :get
        end

        # Returns the query params needed for the HTTP request
        # @return [Hash]
        def query_params
          {}
        end

        # Return the class attributes as a Hash
        # @return [Hash]
        def body
          as_json.deep_symbolize_keys
        end

        # Tells if the request needs the api_token in the query params
        def needs_authorization?
          true
        end
      end
    end
  end
end
