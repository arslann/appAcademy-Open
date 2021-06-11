class Tile
    attr_reader :isBomb, :flagged
    attr_accessor :neighbors, :revealed
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
        if @flagged == true
            @flagged = false
        else
            @flagged = true
        end
    end

end