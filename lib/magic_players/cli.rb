#Our CLI Controller
class MagicPlayers::CLI

  def call
    list_players
    player_selection
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
    puts "Select the player that you want to know about!"
  end

end
