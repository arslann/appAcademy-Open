class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
        
    end
    
    def valid?(position)
        row = position[0]
        col = position[1]
        
        return false if @grid[row] == nil || @grid[row][col] == nil || row < 0 || col < 0
        return true

    end

    def empty?(position)
        return true if @grid[position[0]][position[1]] == "_"
        return false
    end

    def place_mark(position, mark)
        raise "invalid mark" if !valid?(position) || !empty?(position)
        row = position[0]
        col = position[1]

        @grid[row][col] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(' ')
        end
    end
    def win_row?(mark)
        @grid.any? {|row| row.all?(mark)}
    end

    def win_col?(mark)
        @grid.transpose.any? {|col| col.all?(mark)}
    end

    def win_diagonal?(mark)
        (0...@grid.length).all? do |i|
            @grid[i][i] == mark || @grid[i][@grid.length - i - 1] == mark
        end
    end
    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
        return false
    end
    def empty_positions?
        @grid.any? {|row| row.any?("_")}
    end
end


