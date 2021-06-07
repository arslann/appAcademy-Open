# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(num)
    primes = []
    if num <= 2
        return 2
    end
    (2...num).each do |factor|
        if num % factor == 0 && factor % 2 != 0
            primes << factor
        end
    end
    if primes.length < 1
        return num
    end
    primes[-1]
end

def unique_chars?(str)

    str.each_char.with_index do |char1, idx1|
        str.each_char.with_index do |char2, idx2|
            if idx2 > idx1 
                if char1 == char2
                    return false
                end
            end
        end
    end
    true
end

def dupe_indices(arr)
    repeat = Hash.new { |h, k| h[k] = [] }

    arr.each.with_index do |ele1, idx1|
        arr.each.with_index do |ele2, idx2|
            if idx2 != idx1 && ele1 == ele2
                 repeat[ele1] << idx1
                 break
            end        
        end
    end
    repeat
end

def ele_count(arr)
    count = Hash.new(0)

    arr.each { |ele| count[ele] += 1 }

    count
end

def ana_array(arr_1, arr_2)
    count_1 = ele_count(arr_1)
    count_2 = ele_count(arr_2)
    count_1 == count_2
end