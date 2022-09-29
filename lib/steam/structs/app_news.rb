module Steam
  module Structs
    # Struct that holds the Player Summary information
    # @see https://developer.valvesoftware.com/wiki/Steam_Web_API#GetPlayerSummaries_.28v0002.29
    class AppNews < Base
      attribute :appnews do
        # Steam ID of the app
        attribute :appid?, Types::Integer
        attribute :count?, Types::Integer
        attribute :newsitems?, Types::Strict::Array.of(AppNew)
      end
    end
  end
end
