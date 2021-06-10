class Tile
    attr_reader :isBomb
    attr_accessor :neighbors
    def initialize(bomb)   
        @isBomb = bomb
        @flagged = false
        @revealed = false
        @neighbors = 0
    end

    def reveal
        @revealed = true
    end

    def flag
        @flagged = true
    end

    def unflag
        @flagged = false
    end
end