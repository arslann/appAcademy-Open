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
        if @flagged == false
            @revealed = true
        end
    end

    def flag
        if @flagged == true
            @flagged = false
        else
            @flagged = true
        end
    end

end