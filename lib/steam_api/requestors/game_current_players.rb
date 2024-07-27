module SteamApi
  module Requestors
    # Class that expose the necessary method(s) to get number of current players
    # for a game in the Steam Web Api.
    class GameCurrentPlayers < Base
      # Get the number of current players for a game.
      # @param [Integer] appid The Steam app id
      # @return [SteamApi::Structs::GameCurrentPlayers] instance with the
      #   game current players count.
      def retrieve(appid)
        build_request_and_run(
          SteamApi::Structs::Requests::GetGameCurrentPlayers,
          SteamApi::Structs::GameCurrentPlayers,
          appid: appid
        )
      end
    end
  end
end
