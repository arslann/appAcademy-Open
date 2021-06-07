require_relative "board"
require_relative "human_player"

class Game
    def initialize(p1_mark, p2_mark)
        @player1 = HumanPlayer.new(p1_mark)
        @player2 = HumanPlayer.new(p2_mark)
        @current_player = @player1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
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