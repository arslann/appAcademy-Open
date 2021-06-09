class Tile
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

    def neighbors
        
    end


end