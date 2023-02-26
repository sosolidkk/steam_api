module SteamApi
  module Requestors
    # Class that expose the necessary method(s) to get the details of an
    # app in the Steam Web Api.
    class AppDetails < Base
      # Get on the Api the details of an app.
      # @param [Array<Integer>] appid - The Steam app id
      # @param [Array<Integer>] filters - The Steam to filter field values
      # @return [SteamApi::Structs::PlayerSummaries] instance with the
      #   player summary details.
      def retrieve(appid, filters=[])
        build_request_and_run(
          SteamApi::Structs::Requests::GetAppDetails,
          SteamApi::Structs::AppDetails::Details,
          appid: appid,
          filters: filters
        )
      end
    end
  end
end
