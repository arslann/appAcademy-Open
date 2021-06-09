class Array
    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end

        self
    end
    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end

        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if !prc.call(ele)
        end
        new_arr

    end
    def my_any?(&prc)
        self.my_each do |ele| 
            return true if prc.call(ele)
            
        end
        return false

    end

    def my_all?(&prc)
        self.my_each do |ele| 
            return false if !prc.call(ele)
            
        end
        return true
    end
    def my_flatten
        flattened = []

        self.my_each do |el|
            if el.is_a?(Array)
                flattened.concat(el.my_flatten)
            else
                flattened << el
            end
        end
        flattened       
    end
    def my_zip(*arrays)
        zipped = []
        self.length.times do |i|
            subzip = [self[i]]

            arrays.my_each do |array|
                subzip << array[i]
            end
            zipped << subzip
        end
        zipped
    end

    def my_rotate(num = 1)
        split = num % self.length

        self.drop(split) + self.take(split)

    end

    def my_join(seperator = "")
        new_str = ""
        self.my_each do |ele|
            new_str += ele + seperator
        end
        new_str
    end

    def my_reverse
        reversed = []
        self.my_each do |ele|
            reversed.unshift(ele)
        end
        reversed
    end
end

p [ "a", "b", "c" ].my_reverse 