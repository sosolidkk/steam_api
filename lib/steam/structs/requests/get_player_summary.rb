module Steam
  module Structs
    module Requests
      class GetPlayerSummary < Abstract
        attribute :steamids, Types::Array.of(Types::Coercible::String)

        # Build the struct through the received params.
        # @params [Hash] params - The hash params.
        # @return an instance of the Struct
        def self.build_from_params(params)
          raise StandardError, ':steamids are missing' if params[:steamids].empty?

          new(params)
        end

        def version
          'v0002/'
        end

        def interface
          'ISteamUser/'
        end

        def path
          'GetPlayerSummaries/'
        end

        def query_params
          {steamids: steamids}
        end

        def body
          {}
        end
      end
    end
  end
end
