class Stack
    def initialize
        @temper_array = []
    end

    def push(el)
        @temper_array.push(el)
    end

    def pop 
        @temper_array.pop
    end

    def peek
        @temper_array.last
    end

    attr_reader :underlying_array

end

class Queue
    def initialize
        @array = []
    end

    def enqueue(el)
        @array.push(el)
    end

    def dequeue
        @array.shift
    end

    def peek
        @array.first
    end
end