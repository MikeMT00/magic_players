require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://api-nba-v1.p.rapidapi.com/players/teamId/26")

class GetPlayers

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
request["x-rapidapi-key"] = '601b131cb1mshd49db1d37cdb4dep118f4fjsnde6b89799391'

end

response = http.request(request)
puts response.read_body
