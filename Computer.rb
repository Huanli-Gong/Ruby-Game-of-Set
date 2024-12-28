#requries Table, Card, and Deck files
require_relative "Table.rb"
require_relative "Deck.rb"
require_relative "Card.rb"

#this class runs a virtual player and gathers statatistics about the sets
class Computer



#method compares cards to make sure none of their attributes are the same
def self.check(a,b,c)

    return (a==b && a==c && b==c) || (a!=b && a!=c && b!=c)

end


#this method checks for a set depending on the level that the player chooses to play at
#different levels check for varying criteria for what constitues a set
def self.set?(card1,card2,card3,levels)

    case levels

    when 1

        return check(card1.number,card2.number,card3.number)  

    when 2

        return check(card1.number,card2.number,card3.number)&&check(card1.shape,card2.shape,card3.shape)

    when 3

        return check(card1.number,card2.number,card3.number)&&check(card1.shape,card2.shape,card3.shape)&&check(card1.color,card2.color,card3.color)

    when 4

        return check(card1.number,card2.number,card3.number)&&check(card1.shape,card2.shape,card3.shape)&&check(card1.color,card2.color,card3.color)&&check(card1.shading,card2.shading,card3.shading)

    puts "wrong levels"

    return

    end

end


#this method generates a hint for the player
#the hint will be 2 out of 3 cards in a set
def self.hint(table,level)
    l = 0
    i = 0
    j = 0
    k = 0

        #logic to look through cards in a table and find a set
        while i < table.size
            j = i + 1
            while j < table.size
                k = j + 1
                while k < table.size

                    #if a set is found the loop breaks and returns the first 2 cards
                  if set?(table.card(i),table.card(j),table.card(k),level)  
                        l = 1
                        puts " "
                        puts "Try making a set with card #{i} and #{j}"
                        break if l == 1
                    end
                    k += 1
                    break if l == 1
                end
                j += 1
                break if l == 1
            end
            i += 1
            break if l == 1
        end
        if l==0
            #outputs if no set is found in the table.
        	puts "There is no set on the table"
	end
end

#method that runs play for virtual player
def self.play(table,level,deck)   
	haveSet=true

    while table.size>0 && haveSet
            i=0
            j=0
            k=0

    	table.display
    	find=false
        while i < table.size && !find
            j = i + 1
            while j < table.size && !find
                k = j + 1
                while k < table.size && !find
                  if set?(table.card(i),table.card(j),table.card(k),level)  
                        puts "\nfind a set: "
                        puts "#{i} : " + table.card(i).description
                        puts "#{j} : " + table.card(j).description
                        puts "#{k} : " + table.card(k).description
                        find = true
          if (table.size>12)|| (deck.empty?)
          	table.cardDelete i
          	table.cardDelete j
          	table.cardDelete k
          else
          	table.replaceCard(i,deck.cardDraw)
          	table.replaceCard(j,deck.cardDraw)
          	table.replaceCard(k,deck.cardDraw)
          end                    

                    end
                    k += 1
                end
                j += 1

            end
            i += 1

        end
        if !find 
        	if deck.empty?
        		haveSet=false
           
            else 
 		puts "\nNo set. Add 3 cards"
            		3.times do 
                table.tableAdd(deck.cardDraw)
        	end
	end
	end
    end
end

#this method keeps track of statistics for the virtual player
def self.statistics(level,times,cards)
	setNumber=0.0
	noSet=0.0

    times.times do
      	deck = Deck.new
    	table = Table.new(deck)
    	cards.times do
    		table.tableAdd deck.cardDraw
    		end
    	find=false
    	i = 0

    	j = 0

    	k = 0

        while i < table.size 
            j = i + 1
            while j < table.size
                k = j + 1
                while k < table.size
                  if set?(table.card(i),table.card(j),table.card(k),level)  
			setNumber+=1
			find = true
                    end
                    k += 1
                end
                j += 1
            end
            i += 1
        end

        if !find

		noSet+=1

        end

    end
    puts "Average set number per table: #{setNumber/times} "
puts "Frequency of set not appearing: #{noSet/times}"
end
end
