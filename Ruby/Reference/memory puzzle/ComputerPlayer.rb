class ComputerPlayer
    attr_accessor :previous_guess, :board_size, :matched_cards
    def initialize(size)
        @board_size = size
        @matched_cards = {}
        @known_cards = {}
        @previous_guess = nil
        @pairs_hash = Hash.new(0)
        @next_guess = nil
    end
    def prompt
        
        if previous_guess
            second_guess
        else
            first_guess
        end
    end
    def first_guess
        
        unmatched_pos || random_guess
    end

    def second_guess
        
        second_match || check_for_pair || random_guess
    end


    def receive_revealed_card(pos, value)
        @known_cards[pos] = value

    end

    def receive_match(pos1, pos2)
        @matched_cards[pos1] = true
        @matched_cards[pos2] = true
        
    end

    def random_guess
        guess = nil

        until guess && !@known_cards[guess]
            guess = [rand(board_size), rand(board_size)]
        end
        @previous_guess = guess
        guess
    end

    def unmatched_pos
        pos = nil
        @known_cards.each_value do |val| 
            @pairs_hash[val] = @known_cards.values.count(val)
        end

        return false if @pairs_hash.select {|k,v| v > 1 && !@matched_cards[@known_cards.key(k)]}.empty?

        @known_cards.each do |pos1, val1| 
            @known_cards.each do |pos2, val2|
                if pos1 != pos2 && val1 == val2
                    pos = pos1
                    @previous_guess = pos1
                    @next_guess = pos2          
                end
            end
        end
        pos
    end

    def second_match
        pos = nil
        if @next_guess != nil
            pos = @next_guess
            @next_guess = nil
            @previous_guess = nil
            return pos
        else
            return false
        end
    end

    def check_for_pair
        out = nil
        return false if @known_cards.values.count(@known_cards[@previous_guess]) < 2 && @matched_cards[@previous_guess] == true

        @known_cards.each do |pos, val| 
            if pos != @previous_guess && @known_cards[@previous_guess] == val
            
                @previous_guess = nil
                out = pos
            end
        end
        out
    end
end