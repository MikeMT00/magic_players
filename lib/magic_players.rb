require_relative "./magic_players/version"
require_relative './magic_players/cli'
require_relative './magic_players/players_api'
require_relative './magic_players/players'
require_relative './magic_players/league'
require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://api-nba-v1.p.rapidapi.com/players/teamId/26")



http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
request["x-rapidapi-key"] = '601b131cb1mshd49db1d37cdb4dep118f4fjsnde6b89799391'



response = http.request(request)
puts response.read_body
