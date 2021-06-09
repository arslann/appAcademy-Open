class Tile
    def initialize(bomb)
        @isBomb = bomb
        @flagged = false
        @revealed = false
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