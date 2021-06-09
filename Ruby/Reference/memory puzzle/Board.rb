require_relative "Card.rb"
class Board
    attr_reader :table, :size
    ALPHABET = ("a".."z").to_a

    def initialize(length)
        @table = Array.new(length) {Array.new(length)}
        @size = length
    end

    def populate
        while @table.flatten.count(nil) > 0
            random_letter = ALPHABET.sample
            until @table.flatten.count(random_letter) == 2 do 
                rand = [rand(@table.length), rand(@table.length)]
                if self[rand] == nil
                    self[rand] = random_letter
                end
            end
            ALPHABET.delete(random_letter)
        end
    end

    def [](loc)
        @table[loc[0]][loc[1]]
    end
    
    def []=(loc, v)
        @table[loc[0]][loc[1]] = Card.new(v)
    end

    def render
        system("clear")
        puts "  #{(0...size).to_a.join(' ')}"
        @table.each_with_index do |row, i|
            print i , " "
            row.each do |ele|
                val = ele.hidden ? " " : ele.value
                print val + " "
            end
            puts
        end
    end

    def won?
        return true if @table.flatten.all? {|card| !card.hidden}
        return false
    end

    def reveal(loc)
        return if self[loc].hidden == false
        self[loc].reveal
        return self[loc].value
    end
end
