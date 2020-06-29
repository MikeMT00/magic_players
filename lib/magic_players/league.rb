require_relative './players'
require_relative './players_api'
# require_relative './fans'
# require_relative './pick_players'
require 'pry'
require 'httparty'

#







response = PlayersAPI.get_players
binding.pry
