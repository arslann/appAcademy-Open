require "set"
require_relative "Player"
class Game
    ALPHABET = ("a".."z").to_a
    attr_reader :dictionary, :fragment
     
    def initialize(*players)
        words = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(words)
        @players = players
        @fragment = ""
    end

    def play_round
        until game_over?
            take_turn
            next_player!
        end
        
        defeat
        win?
    end
    def previous_player
        @players[-1]

    end

    def current_player
        @players.first
    end

    def next_player!
        @players.rotate!
    end

    def take_turn
        letter = nil 
        while letter == nil
            guess = current_player.guess(fragment)
            letter = guess
            if valid_play?(guess)           
                @fragment << guess
            else
                current_player.loses -= 1              
            end
        end
    end

    def valid_play?(str)
        return false if !ALPHABET.include?(str)
        
        temp_fragment = fragment + str

        dictionary.any? {|word| word.start_with?(temp_fragment)}
    end

    def game_over?
        return true if current_player.loses == 0 || win?
        return false
    end

    def word_check
        dictionary.any? {|word| word == fragment}
    end

    def defeat
        if current_player.loses == 0
          puts "You lost this game #{current_player.name}"
          true
        end
        false
    end

    def win?
        if word_check
            puts "You won the game #{previous_player.name}"
            true 
        else
            false
        end
    end
end
test = Game.new(Player.new("ada1"), Player.new("smith2"), Player.new("david3"))
test.play_round