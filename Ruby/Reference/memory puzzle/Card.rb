class Card
    attr_reader :hidden, :value
    def initialize(value)
        @hidden = true
        @value = value
    end
    def hide 
        @hidden = true
    end
    def reveal
        @hidden = false
    end
    def ==(guess)
        return true if @value == guess
        return false
    end


end