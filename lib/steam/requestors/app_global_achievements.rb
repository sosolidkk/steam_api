module Steam
  module Requestors
    # Class that expose the necessary method(s) to get the global achievements
    # of an app in the Steam Web Api.
    class AppGlobalAchievements < Base
      # Get on the Api all global achievements info of an App in the Steam.
      # @param [Integer] gameid - The Steam app' id
      # @return [Steam::Structs::AppGlobalAchievements] instance with the
      #   player summary details.
      def retrieve(gameid)
        build_request_and_run(
          Steam::Structs::Requests::GetAppGlobalAchievements,
          Steam::Structs::AppGlobalAchievements,
          gameid: gameid
        )
      end
    end
  end
end
