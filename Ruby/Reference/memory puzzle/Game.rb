require_relative "Card.rb"
require_relative "Board.rb"
require_relative "HumanPlayer.rb"
require_relative "ComputerPlayer.rb"

class Game 

    def initialize(length)
        @board = Board.new(length)
        @board.populate
        @previous_guess = nil
        @player = ComputerPlayer.new(length)
    end

    def play 
        until @board.won?
            @board.render
            guess = @player.prompt
            
            make_guess(guess) 
            
        end
    end

    def make_guess(guess)
        
        val = @board.reveal(guess)
        @player.receive_revealed_card(guess, val)
        @board.render
        
        if @previous_guess  
            if match?(@previous_guess, guess)            
                @player.receive_match(@previous_guess, guess)    
                @previous_guess = nil         
            else     
                @board[guess].hide 
                @board[@previous_guess].hide  
                
            end
            @previous_guess = nil 
        else         
            @previous_guess = guess          
        end
        sleep(2)
    end

    def match?(pos1, pos2)
        @board[pos1] == @board[pos2]
      end
end
test = Game.new(4)
test.play