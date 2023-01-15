# frozen_string_literal: true

module SteamApi
  # Main class to interact with the Steam Api.

  # Before using this client, you need to configure the
  # credentials through the 'SteamApi::Client.configure' method:
  #
  # ```ruby
  # SteamApi::Client.configure do |config|
  #   config.api_token = 'token-value'
  # end
  # ```
  #
  # All API calls take the form:
  # http://api.steampowered.com/<interface name>/<method name>/<version>/?key=<api key>&format=<format>.
  # Format can be any of:
  #   json - The output will be returned in the JSON format
  #   xml - Output is returned as an XML document
  #   vdf - Output is returned as a VDF file.
  # If you do not specify a format, your results will be returns in the JSON format.
  class Client
    extend ::Dry::Configurable

    BASE_ENDPOINT = 'https://api.steampowered.com'

    setting :api_token

    attr_accessor :api_token

    attr_reader \
      :app_global_achievements,
      :app_news,
      :game_current_players,
      :player_achievements,
      :player_friends,
      :player_game_stats,
      :player_level,
      :player_owned_games,
      :player_recent_games,
      :player_steamid,
      :player_summaries

    # Initialize the client
    # @param [String] api_token - An existing api token.
    # @return [SteamApi::Client] - A new class instance.
    def initialize(api_token=nil)
      @api_token = api_token

      @app_global_achievements ||= SteamApi::Requestors::AppGlobalAchievements.new(self)
      @app_news ||= SteamApi::Requestors::AppNews.new(self)
      @game_current_players ||= SteamApi::Requestors::GameCurrentPlayers.new(self)
      @player_achievements ||= SteamApi::Requestors::PlayerAchievements.new(self)
      @player_friends ||= SteamApi::Requestors::PlayerFriends.new(self)
      @player_game_stats ||= SteamApi::Requestors::PlayerGameStats.new(self)
      @player_level ||= SteamApi::Requestors::PlayerLevel.new(self)
      @player_owned_games ||= SteamApi::Requestors::PlayerOwnedGames.new(self)
      @player_recent_games ||= SteamApi::Requestors::PlayerRecentGames.new(self)
      @player_steamid ||= SteamApi::Requestors::PlayerSteamId.new(self)
      @player_summaries ||= SteamApi::Requestors::PlayerSummaries.new(self)
    end

    # Return the client config values
    def config
      self.class.config
    end

    def base_endpoint
      BASE_ENDPOINT
    end
  end
end