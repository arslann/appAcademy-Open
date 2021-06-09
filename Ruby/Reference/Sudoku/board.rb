require_relative "tile"

class Board
    def self.empty_grid
        Array.new(9) do 
            Array.new(9) { Tile.new(0) }
        end
    end

    def self.from_file(filename)
        rows = File.readlines(filename).map(&:chomp)
        tiles = rows.map do |row|
            nums = row.split("").map {|char| Integer(char)}
            nums.map {|num| Tile.new(num)}
        end
        self.new(tiles)
    end


    def initialize(grid = Board.empty_grid)

        @grid = grid

    end

    def [](pos)
        row, col = pos
        @grid[row][col]

    end

    def []=(pos, value)
        row, col = pos
        tile = @grid[row][col]
        tile.value = value
    end

    def render
        puts "  #{(1..9).to_a.join(" ")}"
        @grid.each_with_index do |row, i|
            print i + 1, " "
            row.each do |ele|
                print ele.value , " "
            end
            puts
        end
    end

    def row_solved?
        @grid.all? do |row|
            nums = row.map(&:value).sort
            nums == (1..9).to_a
        end

    end

    def square_solved?
        square_array = []
        
        (0...9).each do |i|
            
            
            (0...9).each do |j|
                if j % 3 == 0 && i % 3 == 0
                   row = []
                   row << @grid.transpose[i][j, 3].map(&:value)
                   row << @grid.transpose[i + 1][j, 3].map(&:value)
                   row << @grid.transpose[i + 2][j, 3].map(&:value)
                   square_array << row.flatten
                end
            end
            
        end
        
        square_array.all? do |row|
            nums = row.map.sort
            nums == (1..9).to_a
        end
    end

    def col_solved?
        @grid.transpose.all? do |row|
            nums = row.map(&:value).sort
            nums == (1..9).to_a
        end
    end

    def solved?
        return col_solved? && row_solved? && square_solved?
    end

end
