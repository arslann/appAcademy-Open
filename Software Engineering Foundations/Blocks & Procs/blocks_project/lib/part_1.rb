def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject { |ele| ele["age"] < 3}
end

def count_positive_subarrays(arr)
    arr.count {|ele| ele.sum > 0}
end

def aba_translate(str)
    vowels = "aeiou"
    new_str = ""

    str.each_char do |char|
        if vowels.include?(char)
            new_str += char + "b" + char
        else 
            new_str += char
        end
    end
    return new_str
end

def aba_array(arr)
    arr.map {|ele| aba_translate(ele)}
end

