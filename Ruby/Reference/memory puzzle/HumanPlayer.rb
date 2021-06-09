class HumanPlayer
    def initialize(size)
        ## Duck typing
    end
    def receive_revealed_card(pos, value)
        ## Duck typing
    end
    def receive_match(pos1,pos2)
        #Duck typing
    end
    def prompt
        puts "Player enter two numbers representing a position in the format `row col`"
        pos = gets.chomp.split(' ').map(&:to_i)
        raise 'sorry, that was invalid :(' if pos.length != 2
        return pos
    end
end