require_relative "Board"
require_relative "Tile"

class Game
    def initialize
        @board = Board.new
    end

    def get_pos

        puts "Player enter two numbers representing a position in the format `r & f and position`"
        input = gets.chomp.split(' ')
        action = input[0]
        pos = input[1..-1].map(&:to_i)
    end

    def play
        until @board.win? || @board.lose?
            
        end
    end
end

test = Game.new
p test.get_pos

