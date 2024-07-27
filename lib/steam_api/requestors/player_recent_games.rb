module SteamApi
  module Requestors
    # Class that exposes the necessary method(s) to get a list of
    # recently played games for a user.
    class PlayerRecentGames < Base
      # Returns a list of recently played games for a user.
      # @param [Integer] steamid - The Steam user id
      # @param [Integer] count - The number of games that should return
      # @return [SteamApi::Structs::PlayerRecentGames] instance with the
      #   player summary details.
      def retrieve(steamid, count = 5)
        build_request_and_run(
          SteamApi::Structs::Requests::GetPlayerRecentGames,
          SteamApi::Structs::PlayerRecentGames,
          steamid: steamid,
          count: count
        )
      end
    end
  end
end
