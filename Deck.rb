
#This class requires the Card class, 
#and creates a deck that cards will be drawn from for the duration of a game

require_relative "Card.rb"
class Deck

#method initializes a deck and shuffles it
    def initialize
        @set_deck = Array.new
        
        createDeck
        @set_deck.shuffle!()

    end
    

#method draws one card out of the deck
    def cardDraw
        @set_deck.shift
    end

#method adds one card to deck
    def deckAdd(cardNew)
        @set_deck.push cardNew
    end

#method clears a deck
    def clear
        @set_deck.clear
    end
 
 #method displays the deck   
    def display
        for i in 0..@set_deck.length-1 do
            puts "#{i} : " + @set_deck[i].description
        end
    end

#method checks if deck is empty
    def empty?
        @set_deck.empty?
    end




#this method creates a deck of 81 cards
    def createDeck
        # @single_card = Card.new("", "", "", "")
        3.times do |i|
            number = i+1
            3.times do |j| 
                if j==0
                    shape = 'Tilde' 
                elsif j==1
                    shape = 'Oval' 
                else j ==2
                    shape = 'Diamond' 
                end
                3.times do |k|
                    if k==0  
                        color = 'Purple'
                    elsif k==1
                        color = 'Red' 
                    else k == 2
                        color = 'Green'
                    end
                        3.times do |l|
                            if l==0
                                shading = 'Solid'   
                            elsif l == 1
                                shading = 'Stripes'
                            else l == 2
                                shading = 'Blank' 
                            end

                            #pushes each card into a set to form the deck
                            @set_deck.push Card.new(number, shape, color, shading)
                    end
                end 
            end
        end

    end
end
