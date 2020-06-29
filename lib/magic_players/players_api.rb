class MagicPlayers::PlayersAPI

  BASE_URL = "https://rapidapi.com"

  def self.get_players(page=1, limit=20)
    puts "MAKING A NEW REQUEST"
    #
    # url = BASE_URL + "players?offset=#{(page -1)* limit}&limit=#{limit}"
    # res = Net::HTTP::Get.new(url)
    #     request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
    #     request["x-rapidapi-key"] = '601b131cb1mshd49db1d37cdb4dep118f4fjsnde6b89799391'
    # playerarr = res["results"]
    # #binding.pry
    # MagicPlayers::Players.mass_create_from_api(playerarr)
    #
    # response = http.request(request)
    # puts response.read_body

    url = URI("https://api-nba-v1.p.rapidapi.com/players/teamId/26")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = '601b131cb1mshd49db1d37cdb4dep118f4fjsnde6b89799391'

    response = http.request(request)
    puts response.read_body
    MagicPlayers::Players.mass_create_from_api(playerarr)

  end

  def self.get_players_details(player_obj)
    puts "\nMAKING A NETWORK REQUEST.....\n"

    url = player_obj.url
    res = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
        request["x-rapidapi-key"] = '601b131cb1mshd49db1d37cdb4dep118f4fjsnde6b89799391'

    #binding.pry
    player_obj.weight = res["weight"]
    player_obj.height = res["height"]
    player_obj.id = res["id"]
    player_obj.types = res["types"].map {|hash| hash["type"]["name"]}

    response = http.request(request)
    puts response.read_body

  end
      # res
      # res = HTTParty.get(url)
      # # request = Net::HTTP::Get.new(url)
      # # request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
      # # request["x-rapidapi-key"] = '601b131cb1mshd49db1d37cdb4dep118f4fjsnde6b89799391'
  #     url = URI("https://api-nba-v1.p.rapidapi.com/players/teamId/26")
  #
  #
  #
  #     http = Net::HTTP.new(url.host, url.port)
  #     http.use_ssl = true
  #     http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  #
  #     request = Net::HTTP::Get.new(url)
  #     request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
  #     request["x-rapidapi-key"] = '601b131cb1mshd49db1d37cdb4dep118f4fjsnde6b89799391'
  #
  #
  #
  #     response = http.request(request)
  #     puts response.read_body
  #
  # end


end
