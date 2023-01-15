module SteamApi
  module Requestors
    # Class that exposes the necessary method(s) to get The 64 bit Steam ID
    # the vanity URL resolves to.
    class PlayerSteamId < Base
      # Returns the 64 bit Steam ID the vanity URL resolves to.
      # @param [String] vanityurl - The Steam user short url
      # @return [SteamApi::Structs::PlayerSteamId] instance with the
      #   player SteamId.
      def retrieve(vanityurl)
        build_request_and_run(
          SteamApi::Structs::Requests::GetPlayerSteamId,
          SteamApi::Structs::PlayerSteamId,
          vanityurl: vanityurl
        )
      end
    end
  end
end
