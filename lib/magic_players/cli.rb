#Our CLI Controller
class MagicPlayers::CLI

  def call
    list_players
    player_selection
    goodbye
  end

  def list_players
    puts "Pick Your Favorite Magic Player!"
    puts <<-DOC
      1. Dwight Howard
      2. Penny Hardaway
      3. Shaquille ONeal
    DOC
  end

  def player_selection
    puts "Select the number on the player that you want to know about. Type list for list of players. Type exit to leave:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on Player 1..."
      when "2"
        puts "More info on Player 2..."
      when "3"
        puts "More info on Player 3..."
      when "list"
        list_players
      else
        puts "Wrong entry, try again!"
      end
    end
  end

  def goodbye
    puts "Thank you for visiting the Orlando Magic!"
  end


end
