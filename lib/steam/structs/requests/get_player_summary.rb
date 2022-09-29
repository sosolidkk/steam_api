module Steam
  module Structs
    module Requests
      class GetPlayerSummary < Abstract
        def version
          '/v0002'
        end

        def interface
          '/ISteamUser'
        end

        def path
          '/GetPlayerSummaries'
        end

        def body
          {}
        end
      end
    end
  end
end
