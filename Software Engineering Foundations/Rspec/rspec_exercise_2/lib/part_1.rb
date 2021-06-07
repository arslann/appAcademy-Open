def partition(arr, num)
    low = []
    high = []

    arr.each do |ele|
        if ele < num 
            low << ele
        else
            high << ele
        end
    end
    return [low, high]
end

def merge(hash1, hash2)
    newHash = {}

    newHash.merge!(hash1, hash2)
end

def censor(str, arr)
    str2 = str.split(" ")
    vowels = "aeiou"

    str2.each do |ele| 
        if arr.include?(ele.downcase)
            ele.each_char.with_index do |char, i|
                if vowels.include?(char.downcase)
                    ele[i] = "*"
                end
            end
        end
    end
    return str2.join(" ")


end

def power_of_two?(num)
    i = 1

    while i <= num
        if i == num
            return true
        end
        
        i *= 2
    end
    
    return false

end