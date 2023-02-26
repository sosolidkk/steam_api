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
require 'steam_api/requestors/app_details'
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
require 'steam_api/structs/app_details/achievement'
require 'steam_api/structs/app_details/category'
require 'steam_api/structs/app_details/genre'
require 'steam_api/structs/app_details/movie'
require 'steam_api/structs/app_details/sub'
require 'steam_api/structs/app_details/package_group'
require 'steam_api/structs/app_details/requirements'
require 'steam_api/structs/app_details/screenshot'
require 'steam_api/structs/app_details/details'
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
require 'steam_api/structs/requests/storefront_abstract'
require 'steam_api/structs/requests/get_app_details'
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
