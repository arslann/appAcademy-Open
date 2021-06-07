class Item
    def self.valid_date?(str)
        date = str.split("-")
        year = date[0]
        month = date[1].to_i
        day = date[2].to_i

        return false if year.length != 4
        return false if !(0..12).include?(month)
        return false if !(0..31).include?(day)
        return true
    end

    def initialize(title, deadline, description, done = false)
        raise "invalid date" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
        @done = done
    end

    attr_reader :deadline, :done
    attr_accessor :title, :description

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)      
            @deadline = new_deadline
        else
            raise "invalid date" 
        end
    end
    def toggle
        if !done
            @done = true
        else 
            @done = false 
        end
    end
end
