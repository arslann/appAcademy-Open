require_relative "Tile"

class Board
    attr_reader :board
    def initialize
        @board = Array.new(9) do
            Array.new(9) { Tile.new([true, false, false].sample) }
        end
        @board
    end

end

test = Board.new
p test