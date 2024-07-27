module SteamApi
  module Requestors
    # Class that expose the necessary method(s) to get the details of an
    # app in the Steam Storefront Api.
    class AppDetails < Base
      # Get on the Api the details of an app.
      # @param [Integer] appid - The Steam app id
      # @param [Array<Integer>] filters - The Steam to filter field values
      # @param [String] country_code - Country code for method to return appropriate currency values.
      #   Defaults to US
      # @param [String] locale - Localized strings; takes English name of language.
      #   Defaults to en
      # @return [SteamApi::Structs::AppDetails::Details] instance with the
      #   app details.
      def retrieve(appid:, filters: [], country_code: "US", locale: "en")
        build_request_and_run(
          SteamApi::Structs::Requests::GetAppDetails,
          SteamApi::Structs::AppDetails::Details,
          appid: appid,
          filters: filters,
          cc: country_code,
          l: locale
        )
      end
    end
  end
end
