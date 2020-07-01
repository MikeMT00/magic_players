class PlayersAPI

  def self.players_get_call
    url = "https://api-nba-v1.p.rapidapi.com/players/teamId/26"
    response = Net::HTTP.get(URI(url))
    players_info = JSON.parse(response)["results"]
    # request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
    # request["x-rapidapi-key"] = '601b131cb1mshd49db1d37cdb4dep118f4fjsnde6b89799391'
    # response = Net::HTTP.get(url)
    # players_info = JSON.parse(response)["results"]
    http = Net::HTTP.new(url, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = '601b131cb1mshd49db1d37cdb4dep118f4fjsnde6b89799391'

    # response = http.request(request)
    # puts response.read_body

      players_info.each do |players|
          Players.new(name: players["name"], index: players["index"])
      end

  end


  def self.players_info_call(players)
    url = URI("https://api-nba-v1.p.rapidapi.com/players/teamId/26")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = '601b131cb1mshd49db1d37cdb4dep118f4fjsnde6b89799391'

    response = http.request(request)
    puts response.read_body
    # url = "https://www.dnd5eapi.co/api/spells/#{players.index}"
    # response = Net::HTTP.get(URI(url))
    # players_details = JSON.parse(response)

    players.firstName = players_first_name["firstName"]
    players.lastName = players_last_name["lastName"]
    players.yearsPro = players_years_pro["yearsPro"]
    players.collegeName = players_college_name["collegeName"]
  end

end