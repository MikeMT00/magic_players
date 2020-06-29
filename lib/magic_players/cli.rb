#Our CLI Controller
class MagicPlayers::CLI

  def initialize
    @page = 1
    @limit = 20
  end

  def start
    list_players
    get_players_data
    #binding.pry
    main_entry
  end

  def list_players

    puts "\n\n\n\n"
    puts "Pick Your Favorite Magic Player!"
    sleep(2)
    puts "\n\n\n\n"

  end


  def get_players_data
    MagicPlayers::PlayersAPI.get_players(@page, @limit)
  end

  def main_entry
    loop do
        menu
        input = get_player_details
        case input
        when "exit"
            break
        when "invalid"
            next
        when "next"
            @page += 1
            _, stop = get_page_range
            if MagicPlayers::Players.all.length < stop
                get_players_data
            end
        when "prev"
            if @page <= 1
              puts "You have selected Player 1!"
            else
              @page -= 1
            end
        else
            display_single_player(input)
        end

      end
    end

    def menu
        display_player
        display_directions
        #binding.pry
    end

    def get_player_details
        input = gets.strip.downcase
        commands = ["exit", "next", "prev"]
        return input.downcase if commands.include?(input.downcase)
        if input.to_i.between?(1, MagicPlayers::Players.all.length)
            return input.to_i - 1
        else
            puts "Wrong entry! Try another selection!"
            return "Error!"
        end
    end

    def display_player
        start, stop = get_page_range
        players = MagicPlayers::Players.all[start...stop]
        players.each.with_index(start) do |players, index|
            puts "#{index}. #{players.name}"
        end
    end

    def get_page_range
        [(@page - 1) * @limit, @page * @limit]
    end

    def display_single_player(i)
      player_obj = MagicPlayers::Players.all[i]
      MagicPlayers::PlayersAPI.get_player_details(player_obj)
      #binding.pry
      puts player_obj.full_details
      puts 'press any key to continue on'
      gets
    end

    def display_directions
        puts <<-INST

  Choose a player by number or just type 'exit' to exit program!


        INST
    end
end
