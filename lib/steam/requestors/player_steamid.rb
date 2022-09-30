module Steam
  module Requestors
    # Class that exposes the necessary method(s) to get The 64 bit Steam ID
    # the vanity URL resolves to.
    class PlayerSteamId < Base
      # Returns the 64 bit Steam ID the vanity URL resolves to.
      # @param [String] vanityurl - The Steam user short url
      # @return [Steam::Structs::PlayerSteamId] instance with the
      #   player SteamId.
      def retrieve(vanityurl)
        build_request_and_run(
          Steam::Structs::Requests::GetPlayerSteamId,
          Steam::Structs::PlayerSteamId,
          vanityurl: vanityurl
        )
      end
    end
  end
end
