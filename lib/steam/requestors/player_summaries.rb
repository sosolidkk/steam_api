module Steam
  module Requestors
    # Class that expose the necessary method(s) to get the summary of a
    # player profile in the Steam Web Api.
    class PlayerSummaries < Base
      # Get on the Api the summary of a player profile.
      # @param [String] steamids - The Steam order's id
      # @return [Steam::Structs::PlayerSummaries] instance with the
      #   player summary details.
      def retrieve(steamids)
        build_request_and_run(
          Steam::Structs::Requests::GetPlayerSummaries,
          Steam::Structs::PlayerSummaries,
          steamids: steamids
        )
      end
    end
  end
end
