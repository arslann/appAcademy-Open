require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    def initialize(size, players)
        @players = players.map do |mark, is_computer|
            is_computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)

        end
        @current_player = @players.first
        @board = Board.new(size)
    end

    def switch_turn
        @current_player = @players.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            choices = @board.legal_positions
            pos = @current_player.get_position(choices)
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