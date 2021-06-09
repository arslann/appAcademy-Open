class Player
    attr_accessor :name, :loses
    def initialize(name)
        @name = name
        @loses = 5
    end

    def guess(fragment)
        puts "Current fragment: #{fragment}"
        puts "You have #{loses} remaining"
        puts "Please enter a letter player #{name}: "
        gets.chomp.downcase
    end
end