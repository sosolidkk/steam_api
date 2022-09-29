module Steam
  module Requestors
    # Class that expose the necessary method(s) to get the summary of a
    # player profile in the Steam Web Api.
    class AppNews < Base
      # Get on the Api the summary of a player profile.
      # @param [String] steamids - The Steam order's id
      # @return [Steam::Structs::AppNews] instance with the
      #   player summary details.
      def retrieve(appid, count, maxlength=300)
        build_request_and_run(
          Steam::Structs::Requests::GetAppNews,
          Steam::Structs::AppNews,
          appid: appid,
          count: count,
          maxlength: maxlength
        )
      end
    end
  end
end
