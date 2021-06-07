class Board

    attr_reader :size

  def initialize(n)
    @grid = Array.new(n) {Array.new(n,:N)}
    @size = @grid.length * @grid.length
  end

  def [](loc)
    @grid[loc[0]][loc[1]]
  end

  def []=(loc, v)
    @grid[loc[0]][loc[1]] = v
  end

  def num_ships()
    arr = @grid.flatten.select {|ele| ele == :S}
    arr.length
  end

  def attack(loc)
    if self[loc] == :S 
        self[loc] = :H
        puts "you sunk my battleship!"
        return true
    else 
        self[loc] = :X
        return false
    end
  end

  def place_random_ships
    count = 0
    while count < ((@size * 25) / 100)
        rand = [rand(@grid.length), rand(@grid.length)]
        if self[rand] != :S
            self[rand] = :S
            count += 1
        end
    end
  end
  def hidden_ships_grid
    @grid.map do |row|
        row.map do |ele|
            if ele == :S
                :N
            else
                ele 
            end
        end
    end
  end

  def self.print_grid(arr)
    arr.each do |row|
        puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
