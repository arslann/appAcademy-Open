require_relative "Board"
require_relative "Tile"

class Game
    def initialize
        @board = Board.new
    end

    def get_pos

        puts "Player enter two numbers representing a position in the format `r & f and position`"
        input = gets.chomp.split(' ')
        
    end

    def play
        until @board.won? || @board.lost?
            @board.render
            input = get_pos
            action = input[0]
            pos = input[1..-1].map(&:to_i)
            @board.reveal_tile(pos.rotate, action)
        end
        puts "Game Over"
    end
end

test = Game.new
test.play

