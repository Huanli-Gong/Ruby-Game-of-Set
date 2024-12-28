require 'colorize'
require_relative "Deck.rb"
require_relative "Card.rb"
class Table
    
    def initialize(deck)
        @set_table = Array.new
        12.times do
            @set_table.push deck.cardDraw
        end
    end
    
    #outputs number of cards in deck
    def size
	@set_table.length
    end
   
    #outputs a card from the deck
    def cardDraw
        @set_table.pop
    end

    #adds new card to deck
    def tableAdd(cardNew)
        @set_table.push cardNew
    end
	
    #clears deck
    def clear
        @set_table.clear
    end
    
    #replaces card with new card
    def replaceCard(i,cardNew)
    	@set_table[i]=cardNew
    end
   
    #Sets the table card
    def card(card)
        @set_table[card]
    end

    #removed cards from the table
    def cardDelete(index)
      @set_table.delete_at(index)
    end

    def display
      
    num = 0;

    #formats cards with even spacing and layout while providing number of shapes, shape, color, and shading 
    for i in 1..(@set_table.length/4.0).ceil do
    rowHeader = ""
    rowIndex = ""
    rowNumber = ""
    rowShape = ""
    rowColor = ""
    rowShading = ""
    rowFooter = ""
    rowEmpty = ""
      for c in 0..3 do
        if num < @set_table.length
          card = @set_table[num] 

          if card.color == "Purple"
            color = String.color_codes.key(5)
          elsif card.color == "Red"
            color = String.color_codes.key(1)
          else
            color = String.color_codes.key(2)
          end

          rowHeader += " _______________         ".colorize(:color => color)
          rowEmpty += "|               |        ".colorize(:color => color)
          rowIndex += "|".colorize(:color => color)
          rowIndex.concat(" " * ((14-num.to_s.length)/2))
          rowIndex +="\##{num}".colorize(:color => color)
          rowIndex.concat(" " * ((14-num.to_s.length)/2.0).ceil)
          rowIndex += "|        ".colorize(:color => color)
         
          rowNumber += "|".colorize(:color => color)
          rowNumber.concat(" " * ((15-card.number.to_s.length)/2))
          rowNumber +="#{card.number}".colorize(:color => color)
          rowNumber.concat(" " * ((15-card.number.to_s.length)/2.0).ceil)
          rowNumber += "|        ".colorize(:color => color)

          rowShape += "|".colorize(:color => color)
          rowShape.concat(" " * ((15-card.shape.length)/2))
          rowShape +="#{card.shape}".colorize(:color => color)
          rowShape.concat(" " * ((15-card.shape.length)/2.0).ceil)
          rowShape += "|        ".colorize(:color => color)

          rowColor += "|".colorize(:color => color)
          rowColor.concat(" " * ((15-card.color.length)/2))
          rowColor +="#{card.color}".colorize(:color => color)
          rowColor.concat(" " * ((15-card.color.length)/2.0).ceil)
          rowColor += "|        ".colorize(:color => color)
          
          rowShading += "|".colorize(:color => color)
          rowShading.concat(" " * ((15-card.shading.length)/2))
          rowShading +="#{card.shading}".colorize(:color => color)
          rowShading.concat(" " * ((15-card.shading.length)/2.0).ceil)
          rowShading += "|        ".colorize(:color => color)
          
          rowFooter += "|_______________|        ".colorize(:color => color)
          
          num+=1
        end
      end  

      puts rowHeader
      puts rowEmpty
      puts rowIndex
      puts rowNumber
      puts rowShape
      puts rowColor
      puts rowShading
      puts rowEmpty
      puts rowFooter
      puts ""

    end

    end
end
