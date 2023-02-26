module SteamApi
  module Structs
    module AppDetails
      # Struct that holds the App/Game video (movies, trailers etc) information
      # @see https://wiki.teamfortress.com/wiki/User:RJackson/StorefrontAPI#appdetails
      class Movie < Base
        attribute :id, Types::Coercible::Integer
        attribute :name, Types::String
        attribute :thumbnail, Types::String
        attribute :webm do
          attribute :max, Types::String
        end
        attribute :mp4 do
          attribute :max, Types::String
        end
        attribute :highlight, Types::Bool
      end
    end
  end
end
