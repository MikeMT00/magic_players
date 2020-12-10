#Our CLI Controller
class Cli

  def run
    puts " "
    puts "Welcome to the world of the Orlando Magic!:"
    sleep 2
    puts " "
    puts "If you are a true fan of the Orlando Magic and are intrested in our current and past players, enter 'Yes'. If you aren't, enter 'Bye' or 'No'"
    @input = gets.strip.downcase
    prompt_user if orig_input(@input)
    prompt_input = gets.strip.downcase

      while prompt_input != "exit"
          if prompt_input.to_i.between?(1, Players.all.length)
              player = Players.all[prompt_input.to_i - 1]
              print_players(player)
          elsif prompt_input == "list"
              Players.all.each.with_index(1) do |player, index|
              puts "#{index}. #{player.name}"
              end
          elsif prompt_input == "#{prompt_input}"
            by_number = Players.find_by_number(prompt_input)
            by_number.each.with_index(1) do |player, index|
              puts "#{index}. #{player.name}"
            end
                if by_number.empty?
                  puts "Try again:"
                else
                  puts "Choose a number to learn more:"
                  puts " "
                  input = gets.strip.to_i
                  player = by_number[input.to_i - 1]
                  PlayersAPI.players_info_call(player)
                  print_players(player)
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
          PlayersAPI.get_players
          puts " "
          Players.all.each.with_index(1) do |player, index|
            puts "#{index}. #{player.name}"
          end
      elsif input == "n" || input == "no" || input == "bye"
          puts " "
          sleep 3
          puts "Well we appreciate you swinging by! Have a great day!"
          exit
      else
          puts "Well thank you for visiting the Orlando Magic!"
          exit
      end 
    end

    def prompt_user
        puts " "
        puts "Enter a 'number' to learn more about an Orlando Magic Player,'list' to see the list again, or type 'exit' to exit!: "
        puts " "
    end

    def print_players(player)
        puts "You've chosen #{player.firstName} #{player.lastName}!"
        sleep 3
        puts "One moment please!"
        sleep 4
        puts " "
        puts " "
        puts "First Name: #{player.firstName}"
        puts "--------------------"
        puts "Last Name: #{player.lastName}"
        puts "--------------------"
        puts "Years Pro: #{player.yearsPro}"
        puts "--------------------"
        puts "College Name: #{player.collegeName}"
    end

end
