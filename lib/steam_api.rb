# frozen_string_literal: true

require 'active_support'
require 'active_support/all'

require 'dry-configurable'
require 'dry-struct'
require 'singleton'
require 'typhoeus'

require 'steam_api/version'
require 'steam_api/request'
require 'steam_api/response'
require 'steam_api/failure_handler'

require 'steam_api/errors/api_error'

require 'steam_api/requestors/base'
require 'steam_api/requestors/app_global_achievements'
require 'steam_api/requestors/app_news'
require 'steam_api/requestors/game_current_players'
require 'steam_api/requestors/player_achievements'
require 'steam_api/requestors/player_friends'
require 'steam_api/requestors/player_game_stats'
require 'steam_api/requestors/player_level'
require 'steam_api/requestors/player_owned_games'
require 'steam_api/requestors/player_recent_games'
require 'steam_api/requestors/player_steamid'
require 'steam_api/requestors/player_summaries'

require 'steam_api/structs/types'
require 'steam_api/structs/base'
require 'steam_api/structs/app_global_achievements'
require 'steam_api/structs/app_new'
require 'steam_api/structs/app_news'
require 'steam_api/structs/game_current_players'
require 'steam_api/structs/player_summary'
require 'steam_api/structs/player_achievements'
require 'steam_api/structs/player_friends'
require 'steam_api/structs/player_game_stats'
require 'steam_api/structs/player_level'
require 'steam_api/structs/player_owned_games'
require 'steam_api/structs/player_recent_games'
require 'steam_api/structs/player_steamid'
require 'steam_api/structs/player_summaries'

require 'steam_api/structs/requests/abstract'
require 'steam_api/structs/requests/get_app_global_achievements'
require 'steam_api/structs/requests/get_app_news'
require 'steam_api/structs/requests/get_game_current_players'
require 'steam_api/structs/requests/get_player_achievements'
require 'steam_api/structs/requests/get_player_friends'
require 'steam_api/structs/requests/get_player_game_stats'
require 'steam_api/structs/requests/get_player_level'
require 'steam_api/structs/requests/get_player_owned_games'
require 'steam_api/structs/requests/get_player_recent_games'
require 'steam_api/structs/requests/get_player_steamid'
require 'steam_api/structs/requests/get_player_summaries'

require 'steam_api/client'

# Main module
module SteamApi; end
