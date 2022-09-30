# frozen_string_literal: true

require 'active_support'
require 'active_support/all'

require 'dry-configurable'
require 'dry-struct'
require 'singleton'
require 'typhoeus'

require 'steam/version'
require 'steam/request'
require 'steam/response'
require 'steam/failure_handler'

require 'steam/errors/api_error'

require 'steam/requestors/base'
require 'steam/requestors/app_global_achievements'
require 'steam/requestors/app_news'
require 'steam/requestors/game_current_players'
require 'steam/requestors/player_achievements'
require 'steam/requestors/player_game_stats'
require 'steam/requestors/player_recent_games'
require 'steam/requestors/player_steamid'
require 'steam/requestors/player_summaries'

require 'steam/structs/types'
require 'steam/structs/base'
require 'steam/structs/app_global_achievements'
require 'steam/structs/app_new'
require 'steam/structs/app_news'
require 'steam/structs/game_current_players'
require 'steam/structs/player_summary'
require 'steam/structs/player_achievements'
require 'steam/structs/player_game_stats'
require 'steam/structs/player_recent_games'
require 'steam/structs/player_steamid'
require 'steam/structs/player_summaries'

require 'steam/structs/requests/abstract'
require 'steam/structs/requests/get_app_global_achievements'
require 'steam/structs/requests/get_app_news'
require 'steam/structs/requests/get_game_current_players'
require 'steam/structs/requests/get_player_achievements'
require 'steam/structs/requests/get_player_game_stats'
require 'steam/structs/requests/get_player_recent_games'
require 'steam/structs/requests/get_player_steamid'
require 'steam/structs/requests/get_player_summaries'

require 'steam/client'

# Main module
module Steam; end
