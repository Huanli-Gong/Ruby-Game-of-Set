#time component added
require 'time'

require_relative "Table.rb"
require_relative "Deck.rb"
require_relative "Card.rb"
require_relative "Computer.rb"




#Main class takes all other files and combines to run the program
class Main


#this method uses user input for various options 
def getInput(table,level)
	get = false

  #array of words from user
	input=Array.new
	until get 
    puts " "
	  puts "Enter three card numbers with spaces in between to indicate a set"
    puts "Ex: 1 2 3"
    puts "OR enter 'more' for 3 additonal cards:"
	  puts "OR type 'hint' if you would you like a hint!"	
          userInput = gets.split" "

          #if user chooses to get a hint
        if userInput[0] == 'hint'
             Computer.hint(table,level) 

          #if user askes for more cards    
        elsif (userInput[0] == "more") 
          get = 0
          input = "more"
        else 
            # Check if the user input is integers
            #uses integers to indicate cards
            if (userInput[0].to_i.to_s==userInput[0]) && (userInput[1].to_i.to_s==userInput[1]) && (userInput[2].to_i.to_s==userInput[2])
              x = userInput[0].to_i
              y = userInput[1].to_i
              z = userInput[2].to_i
       		        
              if x >= 0 && x < table.size && y >= 0 && y < table.size && z >= 0 && z < table.size
	        if ( x != y && x != z && y != z)	
                  get = true
	    	  input[0]=x
	    	  input[1]=y
	    	  input[2]=z

          #prints the users input back
	    	  puts "You chose #{x}, #{y}, and #{z}"

          #this runs for improper inputs
                else
                  puts "\nInvalid input. Please make sure the cards are distinct.\n\n"
		end
              else
                puts "\nInvalid input. Please make sure these cards are on the table.\n\n"
	      end
	  else
              puts "\nInvalid input. Please make sure the input are integers.\n\n"  
	  end 
        end
        
      end
      
      return input
end


#assigns the user levels to play
def getLevel

  puts "Choose levels of difficulty (check following properties):"
  puts "1. number; 2. number & shape; 3. number & shape & color; 4. number & shape & color & shading;"
  level = gets.chomp
  until (level.to_i.to_s==level) && (1..4)===level.to_i
  	puts "\nInvalid input. Please enter 1-4.\n\n"
  	level = gets.chomp
  end
  return level.to_i
end

#table.display



#instructions method for the beginning of the game
def instructions

  puts "Hello, and welcome to the Game of Set"
  puts "To play the game you will select a set of 3 cards"
  puts "Each card has 1 of 3 values..."
  puts "... 1 of 3 colors..."
  puts "... 1 of 3 shapes.."
  puts ".... and 1 of 3 shadings"
  puts "Choose a set of 3 cards where each attriibute is "
  puts "either the SAME or DIFFERENT for all 3 the cards."
  puts "Goodluck!"
  puts " "

end



#this method runs the game

def play

i = 1

instructions


# ask the player for which mode they would like to play
puts "Choose a mode:"
puts "Hit any key to play or.."
puts "'Type 'computer' to watch the computer play this game or..."
puts "Type 'statistics' to do statistics"
puts " "
puts "To exit the game hit the x key"


a = gets.chomp

#starts the timer
startTime=Time.now

#runs if player doesnt exit the game
if a != "x"
  score = 0
  deck = Deck.new
  table = Table.new(deck)
  level = getLevel

  #runs if player chooses to watch computer play
  if a == 'computer'
  	Computer.play(table,level,deck)

  #runs if player chooses statistics
  elsif a == 'statistics'
  	puts "How many times do you want computer to play"
  	times = gets.chomp
  	until (times.to_i.to_s==times) && times.to_i>0
  		puts "\nInvalid input. Please enter a positive integer.\n\n"
  		times = gets.chomp
  	end
  	puts "There are 12 cards on the table."
    puts "If you would like to add more type how many you would like to add."
  	cards = gets.chomp
  	until (cards.to_i.to_s==cards) && (0..69)===cards.to_i
  		puts "\nInvalid input. Please enter a non-negative integer.\n\n"
  		cards = gets.chomp
  	end
  	Computer.statistics(level,times.to_i,cards.to_i)
  else

  #runs if player chooses to play themselves
 #runs timer for player
start = Time.now
  while i>0
        time = Time.now
        table.display
        #runs for player input
        index = getInput(table,level)
	
        while index == "more"
          if !deck.empty?
            3.times do 
              if !deck.empty?
                table.tableAdd(deck.cardDraw)
              end
            end
            table.display 
          else
            table.display 
            puts "\nDeck is empty, please pick a set from the table.\n\n"
          end
          
            index = getInput(table,level)
        end
        
        if Computer.set?(table.card(index[0]),table.card(index[1]),table.card(index[2]),level)
          puts "You found a set in #{(Time.now - time).round(2)} seconds, congratulations! score + #{level}"
          #adds score based on which level player is playing
          score+=level

          #adds cards to the table until deck is empty
          if table.size>12||deck.empty?
          	table.cardDelete(index[0])
          	table.cardDelete(index[1])
          	table.cardDelete(index[2])
          else 

          	table.replaceCard(index[0],deck.cardDraw)
          	table.replaceCard(index[1],deck.cardDraw)
          	table.replaceCard(index[2],deck.cardDraw)
          end
          
        else
          puts "Sorry, they are not a set."	
        end
        
	puts "\nTotal score: #{score}"
	puts "Total time: #{(Time.now - start).round(2)} seconds\n\n"
	
        puts " "

        #asks player if they want to play another round
        if table.size>0
            puts "To keep playing hit any key"
            puts "To change the level hit the l key"
            puts "To exit the game hit the x key"
            b = gets.chomp

                if b == "x"
                    i = 0
                    puts "Goodbye!"
                end
                if b == "l"
                     level = getLevel
                end

        else
          #tells the player when they are out of cards
          #boots them from the game
            puts "Oh no! You are all out of cards."
            puts "Goodbye!"
            i = 0
         end
	end
  end

  #runs if player exits the game or runs out of cards
else    
    puts "Thanks for playing!"
end
end

end

#creates instance of Main to play the game
game = Main.new
game.play
