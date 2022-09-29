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
require 'steam/requestors/player_summary'

require 'steam/structs/types'
require 'steam/structs/base'
require 'steam/structs/player_summary'
require 'steam/structs/player_summaries'

require 'steam/structs/requests/abstract'
require 'steam/structs/requests/get_player_summary'

require 'steam/client'

# Main module
module Steam; end
