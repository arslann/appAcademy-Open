class Tile
    attr_reader :value

    def initialize(value)
        @value = value
        @given = value == 0 ? false : true
    end

    def given?
        @given
    end

    def to_s
        value == 0 ? " " : value.to_s
    end

    def value=(new_value)
        if given?
            puts "You can't change the value of a given tile."
        else
            @value = new_value
        end
    end
end