def range(n, m)
    return [] if m <= n
    range(n, m - 1) << m - 1
    
end

def add_numbers(arr)
    return arr.first if arr.length == 1
    return nil if arr.length <= 0

    arr.shift + add_numbers(arr)

end


def exp1(base, exponent)
    return 1 if exponent < 1
    return base if exponent == 1

    base * exp1(base, exponent - 1)

end


def exp2(base, exponent)
    return 1 if exponent == 0
    calculated = exp2(base, exponent / 2)

    if exponent.even?
        
        calculated * calculated
    else
        base * calculated * calculated

    end

end

class Array 
    def subsets
        return [[]] if empty?
        subs = take(count - 1).subsets
        subs.concat(subs.map {|sub| sub + [last]})

    end

    def deep_dup
        new_arr = []

        self.each do |ele|
            new_arr << (ele.is_a?(Array) ? ele.deep_dup : ele)
        end
        
        new_arr
    end

    def merge_sort
        return self if count < 2
        #index  for half
        middle_index = self.length / 2

        left = self[0...middle_index]
        right = self[middle_index..-1]

        left_merge = left.merge_sort
        right_merge = right.merge_sort

        merge_helper(left_merge, right_merge)
    
    end

    def merge_helper(left, right)
        new_arr = []
        until left.empty? || right.empty?    
            if left.first < right.first
                new_arr << left.shift
            elsif right.first < left.first
                new_arr << right.shift
            end
        end
        #return with remainings elements
        new_arr + left + right
    end
end

def fib(n)
    return 1 if n == 1 || n == 2
    fib(n - 1) + fib(n - 2)
end

def fibonacci(n)
    arr = []
    (1..n).each {|i| arr << fib(i)} 
    arr
end

def bsearch(array, target)
    return nil if array.length < 1

    middle_index = array.length / 2
    left_half = array[0...middle_index]
    right_half = array[middle_index + 1..-1]
    if array[middle_index] == target
        middle_index
    elsif target < array[middle_index]   
        bsearch(left_half, target)
    elsif target > array[middle_index]     
        sub_answer = bsearch(right_half, target)     
        sub_answer.nil? ? nil : middle_index += 1 + sub_answer
    end
end

def permutation(array)
    

end

def make_change(amount, coins = [25, 10, 5, 1])


end