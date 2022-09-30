module Steam
  module Structs
    # Struct that holds all user recent played games
    # @see https://developer.valvesoftware.com/wiki/Steam_Web_API#GetRecentlyPlayedGames_.28v0001.29
    class PlayerRecentGames < Base
      class InternalPlayerRecentGames < Dry::Struct
        attribute :appid, Types::Integer
        attribute :name, Types::String
        attribute :playtime_2weeks, Types::Integer
        attribute :playtime_forever, Types::Integer
        attribute :img_icon_url, Types::String
        attribute :playtime_windows_forever, Types::Integer
        attribute :playtime_mac_forever, Types::Integer
        attribute :playtime_linux_forever, Types::Integer
      end

      attribute :response do
        attribute :total_count?, Types::Integer
        attribute :games?, Types::Strict::Array.of(
          InternalPlayerRecentGames
        )
      end
    end
  end
end
