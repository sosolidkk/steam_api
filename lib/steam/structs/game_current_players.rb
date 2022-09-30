module Steam
  module Structs
    # Struct that holds the number of current players for a game/appid
    # @see https://wiki.teamfortress.com/wiki/WebAPI/GetNumberOfCurrentPlayers
    class GameCurrentPlayers < Base
      attribute :response do
        attribute :player_count?, Types::Integer
        attribute :result, Types::Integer
      end
    end
  end
end
