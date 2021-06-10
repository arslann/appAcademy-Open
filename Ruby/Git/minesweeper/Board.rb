require_relative "Tile.rb"

class Board
    attr_reader :board
    def initialize
        @board = Array.new(9) do
            Array.new(9) { Tile.new([true, false, false].sample) }
        end
    end

    def bomb_counter
        @board.transpose.each.with_index do |row, idx1|
            row.each.with_index do |tile, idx2|
                square = []
                n = idx2 + 1
                while n >= idx2 - 1 && n >= 0
                    if idx1 + 1 < 9 && n < 9
                        square << @board.transpose[idx1 + 1][n]
                    end
                    if idx1 - 1 >= 0 && n < 9
                        square << @board.transpose[idx1 - 1][n]
                    end
                    if @board.transpose[idx1][n] != nil
                        square << @board.transpose[idx1][n]
                    end
                    # square.compact!
                    tile.neighbors += square.count {|ele| ele.isBomb == true}
                    square = []
                    n -= 1
                end
                
            end
        end
    end
    def render
        puts "  #{(1..9).to_a.join(" ")}"
        @board.each_with_index do |row, i|
            print i + 1, " "
            row.each do |ele|
                val = ele.isBomb ? "B" : ele.neighbors
                print String(val) + " "
            end
            puts
        end
    end
end

test = Board.new
test.bomb_counter
test.render