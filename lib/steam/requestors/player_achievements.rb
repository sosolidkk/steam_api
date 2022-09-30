module Steam
  module Requestors
    # Class that exposes the necessary method(s) to get the achievements of a
    # player for a given app.
    class PlayerAchievements < Base
      # Returns a list of achievements for a user by app id.
      # @param [Integer] appid - The Steam app' id
      # @param [Integer] steamid - The Steam user id
      # @return [Steam::Structs::PlayerAchievements] instance with the
      #   player summary details.
      def retrieve(appid, steamid)
        build_request_and_run(
          Steam::Structs::Requests::GetPlayerAchievements,
          Steam::Structs::PlayerAchievements,
          appid: appid,
          steamid: steamid
        )
      end
    end
  end
end
