# Ruby Game of Set For OSU CSE3901

>## To Run: 
        Requires: "gem install colorize"
        To play: "ruby Main.rb"

>## How To Play:
        Hello, and welcome to the Game of Set
        To play the game you will select a set of 3 cards
        Each card has 1 of 3 values...
        ... 1 of 3 colors...
        ... 1 of 3 shapes...
        ... and 1 of 3 shadings
        Choose a set of 3 cards where each attriibute is 
        either the SAME or DIFFERENT for all 3 the cards.
        Goodluck!

        When the game starts you will be given the option to either select to play yourself, watch a computer play, 
        look at statistics, or exit the game.After selecting to either play yourself or watch the computer play you
        will be given an option to select the difficulty of the game (1 being the easiest and 4 being the more difficult).
        Then 12 cards will be shown on the screen. From them the play should try to make a set with 3 cards or type and
        enter in "more" to add 3 additional cards to the board. Additionally if you are having trouble, you can enter "hint".
        The hint command will output 2/3 cards that form a set.

---

>## Additional Features Implemented:
        1. Timer - Displays the time user took to find a set and the total play time at the end of the game.
        2. Hint generator - When the player is stumped, using the generator will show 2 cards of a set.
        3. Computer player - A computer who can play the game by itself.
        4. Statistics - Gives statistics about the average set number per table and the frequency of set not appearing given
           the number of cards on the table.
        5. Modes or Levels - Four modes (Number, Number & Shape, Number & Shape & Color, Number & Shape & Color & Shading)
        6. Display - Displays the card in an image like text.