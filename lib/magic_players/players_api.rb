class PlayersAPI

  BASE_URL = "https://api-nba-v1.p.rapidapi.com"
  def self.get_players
      url = BASE_URL + "/players"
      res = HTTParty.get(url)
      res 
  end


end
