
#this class creates a single card with 4 attributes
class Card
    attr_accessor :number
    attr_accessor :shape
    attr_accessor :color
    attr_accessor :shading


#initializes the card class 

    def initialize(number=nil,shape=nil,color=nil,shading=nil)
        @number = number
        @shape = shape
        @color = color
        @shading = shading
    end

#prints description for each of the 4 attributs
    def description 
        "#{@number}, #{@shape}, #{@color}, #{@shading}"
    end
end
