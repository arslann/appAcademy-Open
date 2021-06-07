class Passenger
    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end
    def has_flight?(number)
        return true if @flight_numbers.include?(number.upcase)
        return false
    end
    def add_flight(number)
        if !has_flight?(number)
            @flight_numbers << number.upcase
        end
    end
end