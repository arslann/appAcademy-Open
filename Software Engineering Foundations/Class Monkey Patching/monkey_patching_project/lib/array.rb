# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length > 0
            return self.max - self.min
        else
            return nil
        end
    end

    def average 
        return nil if self.length < 1

        return self.sum.to_f / self.length.to_f
    end
    def median
        return nil if self.length < 1
        if self.length % 2 != 0
            return self.sort[self.length / 2]
        else      
            return (self.sort[self.length / 2 - 1] + self.sort[self.length / 2]) / 2.0
        end
    end
    def counts 
        myHash = Hash.new(0)
        self.each do |ele|
            myHash[ele] += 1
        end
        return myHash
    end

    def my_count(arg)
        count = 0
        self.each do |ele| 
            if ele == arg
                count += 1
            end
        end
        return count

    end

    def my_index(arg)

        self.each.with_index do |ele,i|
            if ele == arg 
                return i
            end
        end
        return nil
    end

    def my_uniq 
        newarr = []
        self.each do |ele|
            if !newarr.include?(ele)
                newarr << ele
            end
        end
        return newarr
    end

    def my_transpose
        newarr = []
        self.each.with_index do |arr, idx1|
            row = []
            arr.each.with_index do |ele, idx2|
                row << self[idx2][idx1]
            end
            newarr << row
        end
        return newarr
    end
end
