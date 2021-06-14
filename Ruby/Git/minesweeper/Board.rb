require_relative "Tile.rb"

class Board
    attr_reader :board
    def initialize
        @board = Array.new(9) do
            Array.new(9) { Tile.new([false, false, true, false, false,false, false,false, false,false, false,false, false].sample) }
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
                    
                    tile.neighbors += square.count {|ele| ele.isBomb == true}
                    # square.each do |ele|
                    #     if ele.isBomb == false
                    #         ele.reveal
                    #     end
                    # end
                    square = []
                    n -= 1
                end
            end
        end
    end

    def render
        puts "  #{(0..8).to_a.join(" ")}"
        @board.each_with_index do |row, i|
            print i , " "
            row.each do |ele|
                val = if ele.flagged
                    "F"
                elsif ele.revealed
                    ele.neighbors
                else
                    "*"
                end
                print String(val) + " "
            end
            puts
        end
    end

    def [](pos)
        row, col = pos
        @board[row][col]

    end

    def find_neighbors(pos)
        idx1, idx2 = pos
        return false if idx1 < 0 || idx2 < 0 || idx1 > 8 || idx2 > 8
        return false if @board[idx1][idx2].isBomb == true && @board[idx1][idx2].revealed == true
        n = idx2 + 1
        square = {}
        while n >= idx2 - 1 && n >= 0 
            if idx1 + 1 < 9 && n < 9
                square[@board.transpose[idx1 + 1][n]] = [idx1 + 1, n]
            end
            if idx1 - 1 >= 0 && n < 9
                square[@board.transpose[idx1 - 1][n]] = [idx1 - 1, n]
            end
            if @board.transpose[idx1][n] != nil
                square[@board.transpose[idx1][n]] = [idx1, n]
            end         
            n -= 1
        end
        square
    end

    def reveal_tile(tile)
        
               
    end

    def []=(pos, value)
        row, col = pos
        tile = @board[row][col]
        if value == "r"
            tile.revealed = true
        elsif value == "f"
            tile.flag
        end
    end

    def test_method(pos)
        test = find_neighbors(pos)
        test.each do |k,v|
            test2 = find_neighbors(test[k])
            isBomb = find_neighbors(test[k]).all? {|k,v| k.isBomb == false}
            if isBomb
                k.reveal
            end
            test2.each do |k2,v2|
                isBomb2 = k2.isBomb == false
                if isBomb2
                    k2.reveal
                end
            end
        end
    end
end

test = Board.new
test.bomb_counter
# p test.reveal_tile([1,1])
# p test.find_neighbors([1,1])
# p test.find_neighbors([1,1])
# p test.find_neighbors([1,1])
# p test.find_neighbors([1,1])
test.test_method([0,1])
#  test[[0,0]] = "r"
#  test[[0,1]] = "r"
#  test[[0,2]] = "r"
#  test[[1,0]] = "r"
#  test[[1,1]] = "r"
#  test[[1,2]] = "r"
#  test[[2,0]] = "r"
#  test[[2,1]] = "r"
#  test[[2,2]] = "r"
# test[[0,1]] = "f"

test.render