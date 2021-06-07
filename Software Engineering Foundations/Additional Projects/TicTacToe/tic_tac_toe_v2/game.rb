require_relative "board"
require_relative "human_player"

class Game
    def initialize(size, *marks)
        @players = marks.map {|mark| HumanPlayer.new(mark)}
        @current_player = @players.first
        @board = Board.new(size)
    end

    def switch_turn
        @current_player = @players.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "victory"
                puts @current_player.mark.to_s + ' HAS WON!'
                return
            else
                self.switch_turn
            end
        end
        puts 'Game Over'
        puts "draw"
    end
end