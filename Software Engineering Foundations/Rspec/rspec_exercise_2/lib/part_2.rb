def palindrome?(str)
    i = str.length - 1
    reverse = ""
    while i >= 0
        reverse += str[i]
        i -= 1
    end

    return str == reverse

end



def substrings(str)
    arr = str.split("")
    comb = []

    arr.each_with_index do |ele1, idx1|
        temp = ele1
        comb << temp
        arr.each_with_index do |ele2, idx2|
            if idx2 > idx1
                temp += ele2 
                comb << temp
            end

        end
    end
    return comb
end



def palindrome_substrings(str)
    arr = []
    subs = substrings(str)
    subs.each do |ele| 
        if ele.length > 1 && palindrome?(ele)
            arr << ele
        end
    end
    return arr


end