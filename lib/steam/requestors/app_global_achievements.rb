module Steam
  module Requestors
    # Class that expose the necessary method(s) to get the news of an
    # app in the Steam Web Api.
    class AppGlobalAchievements < Base
      # Get on the Api one or more news of an App in the Steam.
      # @param [String] gameid - The Steam app' id
      # @return [Steam::Structs::AppNews] instance with the
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
