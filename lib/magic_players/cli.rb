#Our CLI Controller
class Cli

  def run
    puts " "
    puts "Welcome to the world of the Orlando Magic!:"
    puts " "
    puts "Do you like our Orlando Magic Basketball Players: y or n"
    @input = gets.strip.downcase
    prompt_user if orig_input(@input)
    prompt_input = gets.strip.downcase

      while prompt_input != "exit"
          if prompt_input.to_i.between?(1, Players.all.length)
              players = Players.all[prompt_input.to_i - 1]
              PlayersAPI.players_info_call(players)
              print_spell(players)
          elsif prompt_input == "list"
              Players.all.each.with_index(1) do |players, index|
              puts "#{index}. #{players.name}"
              end
          elsif prompt_input == "#{prompt_input}"
            by_letter = Players.find_by_letter(prompt_input)
            by_letter.each.with_index(1) do |players, index|
              puts "#{index}. #{players.name}"
            end
                if by_letter.empty?
                  puts "Try again:"
                else
                  puts "Choose a number to learn more:"
                  puts " "
                  input = gets.strip.to_i
                  spell = by_letter[input.to_i - 1]
                  PlayersApi.players_info_call(players)
                  print_players(players)
                end
          else
              puts "We don't understand...try again"
          end
              prompt_user
              prompt_input = gets.strip.downcase
      end
          puts "Thank you for visiting your Orlando Magic! See you later!"


    end

    def orig_input(input)
      if input == "y" || input == "yes"
          puts " "
          puts "No Problem! Here is a list of your Orlando Magic Players:"
          sleep 3
          PlayersAPI.players_get_call
          puts " "
          Players.all.each.with_index(1) do |players, index|
            puts "#{index}. #{players.name}"
          end
      else
          puts "Well thank you for visiting the Orlando Magic!"
          exit
        end
    end

    def prompt_user
        puts " "
        puts "Enter a 'number' to learn more about an Orlando Magic Player,'list' to see the list again, a 'letter'
         to list spells by that letter, or type 'exit' to close the Tome: "
        puts " "
    end

    def print_players(players)
        puts "Name: #{players.firstName}"
        puts " "
        puts "Last Name: #{players.lastName}"
        puts " "
        puts "Years Pro: #{players.yearsPro}"
        puts " "
        puts "College Name: #{players.collegeName}"
    end

end
