# frozen_string_literal: true

module Steam
  # Main class to interact with the Steam Api.

  # Before using this client, you need to configure the
  # credentials through the 'Steam::Client.configure' method:
  #
  # ```ruby
  # Steam::Client.configure do |config|
  #   config.api_token = 'token-value'
  # end
  # ```
  #
  # All API calls take the form:
  # http://api.steampowered.com/<interface name>/<method name>/v<version>/?key=<api key>&format=<format>.
  # Format can be any of:
  #   json - The output will be returned in the JSON format
  #   xml - Output is returned as an XML document
  #   vdf - Output is returned as a VDF file.
  # If you do not specify a format, your results will be returns in the JSON format.
  class Client
    extended ::Dry::Configurable

    BASE_ENDPOINT = 'https://api.steampowered.com/'

    setting :api_token

    # Initialize the client
    # @param [String] api_token - An existing api token.
    # @return [Steam::Client] - A new class instance.
    def initialize(api_token=nil)
      @api_token = api_token
    end

    # Return the client config values
    def config
      self.class.config
    end

    def base_endpoint
      BASE_ENDPOINT
    end
  end
end
