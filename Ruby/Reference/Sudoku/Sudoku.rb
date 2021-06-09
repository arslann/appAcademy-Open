require_relative "board"

class Sudoku
    attr_reader :board
    def self.from_file(filename)
        board = Board.from_file(filename)
        self.new(board)
    end

    def initialize(board)
        @board = board

    end

    def get_pos
        pos = nil
        puts "Please enter a position on the board (e.g., '3,4')"
        print "> "
        pos = parse_pos(gets.chomp)
        pos
    end

    def get_val
        val = nil
        puts "Please enter a value between 1 and 9 (0 to clear the tile)"
        print "> "
        val = parse_val(gets.chomp)
        val
    end

    def parse_pos(str)
        str.split(",").map  { |char| Integer(char) }
    end

    def parse_val(string)
        Integer(string)
    end

    def play_turn
        board.render
        pos = get_pos
        val = get_val
        board[pos] = val
    end

    def run 
        play_turn until solved?
        board.render
        puts "Congratulations, you win!"
    end

    def solved?
        @board.solved?
    end

end

test = Sudoku.from_file("sudoku1-solved.txt")
test.run