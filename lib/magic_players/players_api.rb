class PlayersAPI

  def self.get_players
    url = URI("https://api-nba-v1.p.rapidapi.com/players/teamId/26")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = '601b131cb1mshd49db1d37cdb4dep118f4fjsnde6b89799391'
    
    response = http.request(request)
    players_hash = JSON.parse(response.read_body)
    #binding.pry 
    players_info = players_hash["api"]["players"]
    players_info.each do |player|

    firstName = player["firstName"]
    lastName = player["lastName"]
    yearsPro = player["yearsPro"]
    collegeName = player["collegeName"]

    Players.new(firstName: player["firstName"], lastName: player["lastName"], yearsPro: player["yearsPro"], collegeName: player["collegeName"])
      end
  end

end